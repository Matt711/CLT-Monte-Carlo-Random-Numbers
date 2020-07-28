% Author: Matthew Murray
% Description: Implementation of the RANDU generator that was apart
% of the Scientific Subroutine Package on IBM main-frame computers.
% RANDU is a linear congruential pseudorandom number generator
syms finalVector;
syms I_0;
syms a;
syms m;
syms I_n;
I_0 = 35;
a = 65539;
m = 2^31;
finalVector = [I_0 / m];
for n = 1:9999 
    I_n = mod(a * I_0, m);
    finalVector = [finalVector, I_n / m];
    I_0 = I_n;
end
Ctrs = linspace(0, 1, 30);
h = histogram(finalVector, Ctrs);
xlim([0 1]);
ax = gca;
ax.FontSize = 14;
title('Histogram of RANDU with I_0 = 35');
xlabel('Value between 0 and 1');
ylabel('Frequency of value generated');