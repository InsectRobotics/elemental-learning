% Assumes configurations partially excite sub-elements and vice versa

A = [1 0 0 0  0.5 0.5 0.5 0 0 0];
B = [0 1 0 0  0.5 0 0 0.5 0.5 0];
C = [0 0 1 0  0 0.5 0 0.5 0 0.5];
D = [0 0 0 1  0 0 0.5 0 0.5 0.5];

AB = [0.5 0.5 0 0  1 0.5 0.5 0.5 0.5 0];
AC = [0.5 0 0.5 0  0.5 1 0.5 0.5 0 0.5];
AD = [0.5 0 0 0.5  0.5 0.5 1 0 0.5 0.5];
BC = [0 0.5 0.5 0  0.5 0.5 0 1 0.5 0.5];
BD = [0 0.5 0 0.5  0.5 0 0.5 0.5 1 0.5];
CD = [0 0 0.5 0.5  0 0.5 0.5 0.5 0.5 1];

% value of each element before learning
start = [0 0 0 0 0 0 0 0 0 0];