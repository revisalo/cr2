% Copyright 2012, Gurobi Optimization, Inc.

% This example formulates and solves the following simple QP model:
%  minimize
%      x^2 + x*y + y^2 + y*z + z^2
%  subject to
%      x + 2 y + 3 z >= 4
%      x +   y       >= 1
%
% It solves it once as a continuous model, and once as an integer
% model.

names = {'x', 'y', 'z'};
clear model;
model.Q = sparse([1 0.5 0; 0.5 1 0.5; 0 0.5 1]);
model.A = sparse([1 2 3; 1 1 0]);
model.obj = zeros(3,1);
model.rhs = [4 1];
model.sense = '>';

results = gurobi(model);

for v=1:length(names)
    fprintf('%s %e\n', names{v}, results.x(v));
end

fprintf('Obj: %e\n', results.objval);

model.vtype = 'B';

results  = gurobi(model);

for v=1:length(names)
    fprintf('%s %e\n', names{v}, results.x(v));
end

fprintf('Obj: %e\n', results.objval);

