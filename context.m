% Assumes basic elemental representation, with AB=A+B, etc.
% But also have a context variable present
% Try with and without present on test....?

A = [1 0 0 0 1];
B = [0 1 0 0 1];
C = [0 0 1 0 1];
D = [0 0 0 1 1];

AB = [1 1 0 0 1];
AC = [1 0 1 0 1];
AD = [1 0 0 1 1];
BC = [0 1 1 0 1];
BD = [0 1 0 1 1];
CD = [0 0 1 1 1];

% value of each element before learning
start = [0 0 0 0 0];