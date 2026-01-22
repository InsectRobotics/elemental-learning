% Assumes basic elemental representation, with AB=A+B, etc.
A = [1 0 0 0];
B = [0 1 0 0];
C = [0 0 1 0];
D = [0 0 0 1];

AB = [1 1 0 0];
AC = [1 0 1 0];
AD = [1 0 0 1];
BC = [0 1 1 0];
BD = [0 1 0 1];
CD = [0 0 1 1];

% value of each element before learning
start = [0 0 0 0];
