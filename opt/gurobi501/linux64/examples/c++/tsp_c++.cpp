/* Copyright 2012, Gurobi Optimization, Inc. */

/* Solve a traveling salesman problem on a randomly generated set of
   points using lazy constraints.   The base MIP model only includes
   'degree-2' constraints, requiring each node to have exactly
   two incident edges.  Solutions to this model may contain subtours -
   tours that don't visit every node.  The lazy constraint callback
   adds new constraints to cut them off. */

#include "gurobi_c++.h"
#include <cstdlib>
#include <cmath>
#include <sstream>
using namespace std;

string itos(int i) {stringstream s; s << i; return s.str(); }
double distance(double* x, double* y, int i, int j);
void findsubtour(int n, double** sol, int* tourlenP, int* tour);

// Subtour elimination callback.  Whenever a feasible solution is found,
// find the subtour that contains node 0, and add a subtour elimination
// constraint if the tour doesn't visit every node.

class subtourelim: public GRBCallback
{
  public:
    GRBVar** vars;
    int n;
    subtourelim(GRBVar** xvars, int xn) {
      vars = xvars;
      n    = xn;
    }
  protected:
    void callback() {
      try {
        if (where == GRB_CB_MIPSOL) {
          // Found an integer feasible solution - does it visit every node?
          double **x = new double*[n];
          int *tour = new int[n];
          int i, len;
          for (i = 0; i < n; i++)
            x[i] = getSolution(vars[i], n);

          findsubtour(n, x, &len, tour);

          if (len < n) {
            // Add subtour elimination constraint
            GRBLinExpr expr = 0;
            for (i = 0; i < len-1; i++)
              expr += vars[tour[i]][tour[i+1]];
            expr += vars[tour[len-1]][tour[0]];

            addLazy(expr <= len-1);
          }

          for (i = 0; i < n; i++)
            delete[] x[i];
          delete[] x;
          delete[] tour;
        }
      } catch (GRBException e) {
        cout << "Error number: " << e.getErrorCode() << endl;
        cout << e.getMessage() << endl;
      } catch (...) {
        cout << "Error during callback" << endl;
      }
    }
};

// Given an integer-feasible solution 'sol', find the sub-tour that
// contains node 0.  Result is returned in 'tour', and length is
// returned in 'tourlenP'.

void
findsubtour(int      n,
            double** sol,
            int*     tourlenP,
            int*     tour)
{
  bool* seen = new bool[n];
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
  *tourlenP = index + 1;

  delete[] seen;
}

// Euclidean distance between points 'i' and 'j'.

double
distance(double* x,
         double* y,
         int     i,
         int     j)
{
  double dx = x[i]-x[j];
  double dy = y[i]-y[j];

  return sqrt(dx*dx+dy*dy);
}

int
main(int   argc,
     char *argv[])
{
  if (argc < 2) {
    cout << "Usage: tsp_c++ filename" << endl;
    return 1;
  }

  int n = atoi(argv[1]);
  double* x = new double[n];
  double* y = new double[n];

  for (int i = 0; i < n; i++) {
    x[i] = ((double) rand())/RAND_MAX;
    y[i] = ((double) rand())/RAND_MAX;
  }

  GRBEnv *env = NULL;
  GRBVar **vars = new GRBVar*[n];

  try {
    int i, j;

    env = new GRBEnv();
    GRBModel model = GRBModel(*env);

    // Must disable dual reductions when using lazy constraints

    model.getEnv().set(GRB_IntParam_DualReductions, 0);

    // Create binary decision variables

    for (i = 0; i < n; i++)
      vars[i] = model.addVars(n);
    model.update();

    for (i = 0; i < n; i++) {
      for (j = 0; j < n; j++) {
        vars[i][j].set(GRB_CharAttr_VType, GRB_BINARY);
        vars[i][j].set(GRB_DoubleAttr_Obj, distance(x, y, i, j));
        vars[i][j].set(GRB_StringAttr_VarName, "x_"+itos(i)+"_"+itos(j));
      }
    }

    // Integrate new variables

    model.update();

    // Degree-2 constraints

    for (i = 0; i < n; i++) {
      GRBLinExpr expr = 0;
      for (j = 0; j < n; j++)
        expr += vars[i][j];
      model.addConstr(expr == 2, "deg2_"+itos(i));
    }

    // Forbid edge from node back to itself

    for (i = 0; i < n; i++)
      vars[i][i].set(GRB_DoubleAttr_UB, 0);

    // Symmetric TSP

    for (i = 0; i < n; i++)
      for (j = 0; j < i; j++)
        model.addConstr(vars[i][j] == vars[j][i]);

    // Set callback function

    subtourelim cb = subtourelim(vars, n);
    model.setCallback(&cb);

    // Optimize model

    model.optimize();

    // Extract solution

    if (model.get(GRB_IntAttr_SolCount) > 0) {
      double **sol = new double*[n];
      for (i = 0; i < n; i++)
        sol[i] = model.get(GRB_DoubleAttr_X, vars[i], n);

      int* tour = new int[n];
      int len;

      findsubtour(n, sol, &len, tour);

      cout << "Tour: ";
      for (i = 0; i < len; i++)
        cout << tour[i] << " ";
      cout << endl;

      for (i = 0; i < n; i++)
        delete[] sol[i];
      delete[] sol;
      delete[] tour;
    }

  } catch (GRBException e) {
    cout << "Error number: " << e.getErrorCode() << endl;
    cout << e.getMessage() << endl;
  } catch (...) {
    cout << "Error during optimization" << endl;
  }

  for (int i = 0; i < n; i++)
    delete[] vars[i];
  delete[] vars;
  delete[] x;
  delete[] y;
  delete env;
  return 0;
}
