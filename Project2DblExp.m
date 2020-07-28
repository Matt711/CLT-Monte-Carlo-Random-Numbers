% Author: Matthew Murray
% Description: Generating samples from an exponential distribution and
% plotting them
syms X;
syms funcInput;
syms Inverse;
Inverse = linspace(1, 1000, 1000);
funcInput = linspace(-1000, 1000, 1000);
funcOutput = -2 .* abs(funcInput);
X = rand(1, 1000); %constructs the variables
for n = 1:1000 
    %Ensures that the value produced will be in our domain
    %Accuracy is not lost as the probability of any
    %particular point is basically 0
    while X(n) == 0 || X(n) == 1
        X(n) = rand;
    end
end

for n = 1:1000
    if (X(n) < .5)
        Inverse(n) = log(2 * X(n));
    else
        Inverse(n) = -1 * log(2 - 2 * X(n));
    end
end
Z = -100:0.01:100; %Chose to start at -6 and end at 6 b/c it's essentially 0
               %when not between -4 and 4
Y = exp(-2 .* abs(Z));
hold on
subplot(2, 1, 1);
plot(Z,Y);
xlim([-6 6]);
ax = gca;
ax.FontSize = 12;
title('pdf of the double exponential function')
xlabel('value of random variable')
ylabel('probability of a specific value')
subplot(2, 1, 2);
h = histogram(Inverse);
xlim([-6 6]);
title('Histogram of our randomly generated variables')
xlabel('value of random variable')
ylabel('frequency of random variables')
hold off
ax = gca;
ax.FontSize = 12;