#!/usr/bin/python

# Copyright 2012, Gurobi Optimization, Inc.

# This example reads an LP or a MIP from a file, sets a callback
# to monitor the optimization progress, and outputs progress
# information to the screen and to the log file. If the input model
# is a MIP, the callback aborts the optimization after 10000 nodes have
# been explored.


import sys
from gurobipy import *


# Define callback function

def mycallback(model, where):
    if where == GRB.callback.PRESOLVE:
        print 'Removed', model.cbGet(GRB.callback.PRE_COLDEL), 'columns and', \
               model.cbGet(GRB.callback.PRE_ROWDEL), 'rows'
    elif where == GRB.callback.SIMPLEX:
        itcnt = model.cbGet(GRB.callback.SPX_ITRCNT)
        if itcnt % 100 == 0:
            obj  = model.cbGet(GRB.callback.SPX_OBJVAL)
            pinf = model.cbGet(GRB.callback.SPX_PRIMINF)
            dinf = model.cbGet(GRB.callback.SPX_DUALINF)
            pert = model.cbGet(GRB.callback.SPX_ISPERT)
            if pert == 0:
                ch = ' '
            elif pert == 1:
                ch = 'S'
            else:
                ch = 'P'
            print int(itcnt), obj, ch, pinf, dinf
    elif where == GRB.callback.MIP:
        nodecnt = model.cbGet(GRB.callback.MIP_NODCNT)
        if nodecnt % 100 == 0:
            objbst = model.cbGet(GRB.callback.MIP_OBJBST)
            objbnd = model.cbGet(GRB.callback.MIP_OBJBND)
            print int(nodecnt), objbst, objbnd
        if nodecnt > model._mynodelimit:
            model.terminate()
    elif where == GRB.callback.MIPSOL:
        obj     = model.cbGet(GRB.callback.MIPSOL_OBJ)
        nodecnt = int(model.cbGet(GRB.callback.MIPSOL_NODCNT))
        print '*** New solution at node', nodecnt, 'objective', obj
        print model.cbGetSolution(model.getVars())
    elif where == GRB.callback.MIPNODE:
        print '*** New node'
        if model.cbGet(GRB.callback.MIPNODE_STATUS) == GRB.status.OPTIMAL:
            x = model.cbGetNodeRel(model.getVars())
            model.cbSetSolution(model.getVars(), x)

if len(sys.argv) < 2:
    print 'Usage: callback.py filename'
    quit()

# Read and solve model

model = read(sys.argv[1])

# Pass data into my callback function

model._mynodelimit = 10000

model.params.heuristics = 0

model.optimize(mycallback)
