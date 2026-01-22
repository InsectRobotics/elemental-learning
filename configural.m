% Assumes combinations *only* excite a corresponding configural element

A = [1 0 0 0  0 0 0 0 0 0];
B = [0 1 0 0  0 0 0 0 0 0];
C = [0 0 1 0  0 0 0 0 0 0];
D = [0 0 0 1  0 0 0 0 0 0];

AB = [0 0 0 0  1 0 0 0 0 0];
AC = [0 0 0 0  0 1 0 0 0 0];
AD = [0 0 0 0  0 0 1 0 0 0];
BC = [0 0 0 0  0 0 0 1 0 0];
BD = [0 0 0 0  0 0 0 0 1 0];
CD = [0 0 0 0  0 0 0 0 0 1];

% value of each element before learning
start = [0 0 0 0 0 0 0 0 0 0];