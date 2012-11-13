/* Copyright 2012, Gurobi Optimization, Inc. */

// Solve a traveling salesman problem on a randomly generated set of
// points using lazy constraints.   The base MIP model only includes
// 'degree-2' constraints, requiring each node to have exactly
// two incident edges.  Solutions to this model may contain subtours -
// tours that don't visit every node.  The lazy constraint callback
// adds new constraints to cut them off.

import gurobi.*;

public class Tsp extends GRBCallback {
  private GRBVar[][] vars;

  public Tsp(GRBVar[][] xvars) {
    vars = xvars;
  }

  // Subtour elimination callback.  Whenever a feasible solution is found,
  // find the subtour that contains node 0, and add a subtour elimination
  // constraint if the tour doesn't visit every node.

  protected void callback() {
    try {
      if (where == GRB.CB_MIPSOL) {
        // Found an integer feasible solution - does it visit every node?
        int n = vars.length;
        int[] tour = findsubtour(getSolution(vars));

        if (tour.length < n) {
          // Add subtour elimination constraint
          GRBLinExpr expr = new GRBLinExpr();
          for (int i = 0; i < tour.length-1; i++)
            expr.addTerm(1.0, vars[tour[i]][tour[i+1]]);
          expr.addTerm(1.0, vars[tour[tour.length-1]][tour[0]]);
          addLazy(expr, GRB.LESS_EQUAL, tour.length-1);
        }
      }
    } catch (GRBException e) {
      System.out.println("Error code: " + e.getErrorCode() + ". " +
          e.getMessage());
      e.printStackTrace();
    }
  }

  // Given an integer-feasible solution 'sol', find the sub-tour that
  // contains node 0.  Result is returned in 'tour', and length is
  // returned in 'tourlenP'.

  protected static int[] findsubtour(double[][] sol)
  {
    int n = sol.length;
    boolean[] seen = new boolean[n];
    int[] tour = new int[n];
    int i, index, node;

    for (i = 0; i < n; i++)
      seen[i] = false;

    node = 0;
    for (index = 0; index < n; index++) {
      tour[index] = node;
      seen[node] = true;
      for (i = 0; i < n; i++)
        if (sol[node][i] > 0.5 && !seen[i]) {
          node = i;
          break;
        }
      if (i == n)
        break;
    }
    int result[] = new int[index+1];
    for (i = 0; i <= index; i++)
      result[i] = tour[i];
    return result;
  }

  // Euclidean distance between points 'i' and 'j'

  protected static double distance(double[] x,
                                   double[] y,
                                   int      i,
                                   int      j) {
    double dx = x[i]-x[j];
    double dy = y[i]-y[j];
    return Math.sqrt(dx*dx+dy*dy);
  }

  public static void main(String[] args) {

    if (args.length < 1) {
      System.out.println("Usage: java Tsp ncities");
      System.exit(1);
    }

    int n = Integer.parseInt(args[0]);

    try {
      GRBEnv   env   = new GRBEnv();
      GRBModel model = new GRBModel(env);

      // Must disable dual reductions when using lazy constraints

      model.getEnv().set(GRB.IntParam.DualReductions, 0);

      double[] x = new double[n];
      double[] y = new double[n];

      for (int i = 0; i < n; i++) {
        x[i] = Math.random();
        y[i] = Math.random();
      }

      // Create variables

      GRBVar[][] vars = new GRBVar[n][n];

      for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
          vars[i][j] = model.addVar(0.0, 1.0, distance(x, y, i, j),
                                    GRB.BINARY,
                                  "x"+String.valueOf(i)+"_"+String.valueOf(j));

      // Integrate variables

      model.update();

      // Degree-2 constraints

      for (int i = 0; i < n; i++) {
        GRBLinExpr expr = new GRBLinExpr();
        for (int j = 0; j < n; j++)
          expr.addTerm(1.0, vars[i][j]);
        model.addConstr(expr, GRB.EQUAL, 2.0, "deg2_"+String.valueOf(i));
      }

      // Forbid edge from node back to itself

      for (int i = 0; i < n; i++)
        vars[i][i].set(GRB.DoubleAttr.UB, 0.0);

      // Symmetric TSP

      for (int i = 0; i < n; i++)
        for (int j = 0; j < i; j++)
          model.addConstr(vars[i][j], GRB.EQUAL, vars[j][i], "");

      model.setCallback(new Tsp(vars));
      model.optimize();

      if (model.get(GRB.IntAttr.SolCount) > 0) {
        int[] tour = findsubtour(model.get(GRB.DoubleAttr.X, vars));

        System.out.print("Tour: ");
        for (int i = 0; i < tour.length; i++)
          System.out.print(String.valueOf(tour[i]) + " ");
        System.out.println();
      }

      // Dispose of model and environment
      model.dispose();
      env.dispose();

    } catch (GRBException e) {
      System.out.println("Error code: " + e.getErrorCode() + ". " +
          e.getMessage());
      e.printStackTrace();
    }
  }
}
