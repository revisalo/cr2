#!/usr/bin/python

# Copyright 2012, Gurobi Optimization, Inc.

# Solve a traveling salesman problem on a randomly generated set of
# points using lazy constraints.   The base MIP model only includes
# 'degree-2' constraints, requiring each node to have exactly
# two incident edges.  Solutions to this model may contain subtours -
# tours that don't visit every city.  The lazy constraint callback
# adds new constraints to cut them off.

import sys
import math
import random
from gurobipy import *


# Callback - use lazy constraints to eliminate sub-tours

def subtourelim(model, where):
    if where == GRB.callback.MIPSOL:
        selected = []
        # make a list of edges selected in the solution
        for i in range(n):
            sol = model.cbGetSolution([model._vars[i,j] for j in range(n)])
            selected += [(i,j) for j in range(n) if sol[j] > 0.1]
        # find a cycle in the selected edge list
        tour = subtour(selected)
        if len(tour) < n:
            # if the cycle doesn't visit every city, cut it off
            expr = quicksum(model._vars[tour[i], tour[i+1]]
                              for i in range(len(tour)-1))
            expr += model._vars[tour[-1], tour[0]]
            model.cbLazy(expr <= len(tour)-1)


# Euclidean distance between two points

def distance(points, i, j):
    dx = points[i][0] - points[j][0]
    dy = points[i][1] - points[j][1]
    return math.sqrt(dx*dx + dy*dy)


# Given a list of edges, finds the subtour that includes node 0

def subtour(edges):
    selected = [[] for i in range(n)]
    for x,y in edges:
      selected[x].append(y)
    current = 0
    tour = [current]
    visited = [False]*n
    while True:
        visited[current] = True
        neighbors = [x for x in selected[current] if not visited[x]]
        if len(neighbors) == 0:
            break
        current = neighbors[0]
        tour.append(current)
    return tour


# Parse argument

if len(sys.argv) < 2:
    print 'Usage: tsp.py npoints'
    exit(1)
n = int(sys.argv[1])

# Create n random points

random.seed(1)
points = []
for i in range(n):
    points.append((random.randint(0,100),random.randint(0,100)))

m = Model()


# Create variables

vars = {}
for i in range(n):
    for j in range(i+1):
        vars[i,j] = m.addVar(obj=distance(points, i, j), vtype=GRB.BINARY,
                             name='e'+str(i)+'_'+str(j))
        vars[j,i] = vars[i,j]
m.update()


# Add degree-2 constraint, and forbid loops

for i in range(n):
    m.addConstr(quicksum(vars[i,j] for j in range(n)) == 2)
    vars[i,i].ub = 0
m.update()


# Optimize model

m._vars = vars
m.params.DualReductions = 0
m.optimize(subtourelim)


selected = [(i,j) for i in range(n) for j in range(n) if vars[i,j].x > 0.1]
assert len(subtour(selected)) == n

print
print 'Optimal tour:', subtour(selected)
print 'Optimal cost:', m.objVal
print
