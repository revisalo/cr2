#!/usr/bin/python

# Copyright 2012, Gurobi Optimization, Inc.

# Implement a simple MIP heuristic.  Relax the model,
# sort variables based on fractionality, and fix the 25% of
# the fractional variables that are closest to integer variables.
# Repeat until either the relaxation is integer feasible or
# linearly infeasible.

import sys
from gurobipy import *


# Comparison function used to sort variable list based on relaxation
# fractionality

def compare(v1, v2):
    sol1 = v1.x
    sol2 = v2.x
    frac1 = abs(sol1-int(sol1+0.5))
    frac2 = abs(sol2-int(sol2+0.5))
    if frac1 <= frac2:
        return -1
    else:
        return +1


if len(sys.argv) < 2:
    print 'Usage: fixanddive.py filename'
    quit()

# Read model

model = gurobi.read(sys.argv[1])

# Collect integer variables and relax them
intvars = []
for v in model.getVars():
    if v.vType != GRB.CONTINUOUS:
        intvars += [v]
        v.vType = GRB.CONTINUOUS

model.params.outputFlag = 0

model.optimize()


# Perform multiple iterations.  In each iteration, identify the first
# quartile of integer variables that are closest to an integer value in the
# relaxation, fix them to the nearest integer, and repeat.

for iter in range(1000):

# create a list of fractional variables, sorted in order of increasing
# distance from the relaxation solution to the nearest integer value

    fractional = []
    for v in intvars:
        sol = v.x
        if abs(sol - int(sol+0.5)) > 1e-5:
            fractional += [v]

    fractional.sort(compare)

    print 'Iteration', iter, ', obj ', model.objVal, ', fractional',
    print len(fractional)

    if len(fractional) == 0:
        print 'Found feasible solution - objective', model.objVal
        break


# Fix the first quartile to the nearest integer value
    nfix = max(len(fractional)/4, 1)
    for i in range(nfix):
        v = fractional[i]
        fixval = int(v.x+0.5)
        v.lb = fixval
        v.ub = fixval
        print '  Fix', v.varName, 'to', fixval, '( rel', v.x, ')'

    model.optimize()

# Check optimization result

    if model.status != GRB.status.OPTIMAL:
        print 'Relaxation is infeasible'
        break
