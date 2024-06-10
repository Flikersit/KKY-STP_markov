clc;
clear all;
close all;
P1 = [0.5 0.5 0 0 0 0;
      0 0.5 0.5 0 0 0;
      0 0 0.5 0.5 0 0;
      0 0 0 0.5 0.5 0;
      0 0 0 0 0.5 0.5;
      0.5 0 0 0 0 0.5];
P2 = [0 0.4 0 0.3 0 0.3;
      0.5 0 0.5 0 0 0;
      0 0 1 0 0 0;
      0.5 0 0 0 0.5 0;
      0 0 0 1 0 0;
      0 0 0 0 0 1];
 Q2 = P2; 
%% stredny pocet kroku
e = [1;1;1;1;1;1];
ident = eye(6);
syms m11 m12 m13 m14 m15 m16...
     m21 m22 m23 m24 m25 m26...
     m31 m32 m33 m34 m35 m36...
     m41 m42 m43 m44 m45 m46...
     m51 m52 m53 m54 m55 m56...
     m61 m62 m63 m64 m65 m66
M1 = [m11;
     m21;
     m31;
     m41;
     m51;
     m61];
 P21 = P1;
 P21(:, 1) = 0;
 solution = solve(ident*M1 - P21*M1==e, [m11 m21 m31 m41 m51 m61]);
 disp('Solution for M1:');
 solution.m11
 solution.m21
 solution.m31
 solution.m41
 solution.m51
 solution.m61
 
 
M2 = [m12;
     m22;
     m32;
     m42;
     m52;
     m62];
 P22 = P1;
 P22(:, 2) = 0;
 solution = solve(ident*M2 - P22*M2==e, [m12 m22 m32 m42 m52 m62]);
 disp('Solution for M2:');
 solution.m12
 solution.m22
 solution.m32
 solution.m42
 solution.m52
 solution.m62

 
 M3 = [m13;
     m23;
     m33;
     m43;
     m53;
     m63];
 P23 = P1;
 P23(:, 3) = 0;
 solution = solve(ident*M3 - P23*M3==e, [m13 m23 m33 m43 m53 m63]);
 disp('Solution for M3:');
 solution.m13
 solution.m23
 solution.m33
 solution.m43
 solution.m53
 solution.m63
 
 M4 = [m14;
     m24;
     m34;
     m44;
     m54;
     m64];
 P24 = P1;
 P24(:, 4) = 0;
 solution = solve(ident*M4 - P24*M4==e, [m14 m24 m34 m44 m54 m64]);
 disp('Solution for M4:');
 solution.m14
 solution.m24
 solution.m34
 solution.m44
 solution.m54
 solution.m64
 
 
 M5 = [m15;
     m25;
     m35;
     m45;
     m55;
     m65];
 P25 = P1;
 P25(:, 5) = 0;
 solution = solve(ident*M5 - P25*M5==e, [m15 m25 m35 m45 m55 m65]);
 disp('Solution for M5:');
 solution.m15
 solution.m25
 solution.m35
 solution.m45
 solution.m55
 solution.m65
 
 
 M6 = [m16;
     m26;
     m36;
     m46;
     m56;
     m66];
 P26 = P1;
 P26(:, 6) = 0;
 solution = solve(ident*M6 - P26*M6==e, [m16 m26 m36 m46 m56 m66]);
 disp('Solution for M1:');
 solution.m16
 solution.m26
 solution.m36
 solution.m46
 solution.m56
 solution.m66
 %% finalni pravdepodobnost
 X = eye(size(P1));

% podminka zastaveni
tolerance = 1e-6;
max_iterations = 1000;

% Iterace
for i = 1:max_iterations
    X_new = P1 * X;
    if max(abs(X_new - X), [], 'all') < tolerance
        break;
    end
    X = X_new;
end

% vysledek
X

%% stredny pocet pruchodu stavem
Q2(6, :) = [];
Q2(:, 6) = [];
Q2(3, :) = [];
Q2(:, 3) = [];
I = eye(4);
T = inv(I - Q2);
E = [1; 1; 1; 1];
t = T*E;
%% absorpcni stavy
% absorpcni stav 3
p1 = [0 0.4 0.3 0;
      0.5 0 0 0;
      0.5 0 0.5 0;
      0 0 1 0];
i = eye(4);
syms d1 d2 d4 d5
D = [d1; d2; d4; d5];
pk = [0; 0.5; 0; 0];
eqn = i*D - p1*D == pk;
S = solve(eqn,[d1 d2 d4 d5]);
% absorpcni stav 6
pk2 = [0.3;0;0;0];
eqn2 = i*D - p1*D == pk2;
S2 = solve(eqn2,[d1 d2 d4 d5]);


