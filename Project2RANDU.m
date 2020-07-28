% Author: Matthew Murray
% Description: Implementation of the RANDU generator that was apart
% of the Scientific Subroutine Package on IBM main-frame computers.
% RANDU is a linear congruential pseudorandom number generator
syms I_0; %initial seed
syms a;
syms m; %modulus
%syms n;
syms finalMatrix;
syms addRow;
syms z;
syms I_n;
syms I_n1;
I_0 = 35;
a = 65539;
m = 2^31;
%n = (1:10000);
finalMatrix = [35 / m, 2293865 / m, 13762875 / m];
%RANDU calculation
for n = 1:9999
    I_n = mod(a * I_0, m);
    I_n1 = mod(a * I_n, m);
    addRow = [I_0 / m, I_n / m, I_n1 / m];
    finalMatrix = [finalMatrix; addRow];
    I_0 = I_n;
end
%plot
ax = gca;
ax.FontSize = 14;
bar3(finalMatrix);
title('3D graph of I_n_-_1, I_n, I_n_+_1');
xlabel('Value of I_n');
ylabel('Value of n');
zlabel('Ratio of I_n and m');