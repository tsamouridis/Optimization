% visualizaton of the convergence of Steepest Descent algorithm with 
% gamma = 2.9
clear variables; close all; clc;

load_function
gamma = 2.9;
epsilon = 0.001;

x1 = 5; y1 = 0; plot_limits = [-6 6 -6 6];

figure;

[~, k, x_k, y_k] = steepest_descent(f, x1, y1, gamma, epsilon);
fcontour(f, plot_limits);
hold on;
plot(x_k, y_k)
xlabel('x')
ylabel('y')
plot(x_k(1), y_k(1), 'o', 'color', 'red')
plot(x_k(end), y_k(end), 'x', 'color', 'red')
legend('', 'Path', 'Starting point', 'Point of minimum')
temp_title = sprintf('gamma = %.3f', gamma);
title(temp_title)
grid on;
fprintf('For gamma = %.3f, there is(are) %d iteration(s).\n', gamma, k)
