close all; clear variables;

load_functions
a1 = -1;
b1 = 3;
n = 100;    % number of different values of epsilon to call the function
number_of_calculations_f1 = nan(1, n);
number_of_calculations_f2 = nan(1, n);
number_of_calculations_f3 = nan(1, n);

lambda = 10^-2;
epsilon_values = linspace(10^-5, 10^-3, n);

for i = 1:n
    [~, ~, ~, ~, number_of_calculations_f1(i)] = bisection_method(f1, a1, b1, lambda, epsilon_values(i));
    [~, ~, ~, ~, number_of_calculations_f2(i)] = bisection_method(f2, a1, b1, lambda, epsilon_values(i));
    [~, ~, ~, ~, number_of_calculations_f3(i)] = bisection_method(f3, a1, b1, lambda, epsilon_values(i));
end

figure
subplot(3,1,1)
plot(epsilon_values, number_of_calculations_f1)
title('f_1(x)')
grid on;
xlabel('\epsilon')

subplot(3,1,2)
plot(epsilon_values, number_of_calculations_f2)
title('f_2(x)')
grid on;
xlabel('\epsilon')

subplot(3,1,3)
plot(epsilon_values, number_of_calculations_f3)
title('f_3(x)')
grid on;
xlabel('\epsilon')