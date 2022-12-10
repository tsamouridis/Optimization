% A special case of Steepest Descent for big constant gamma and starting
% point at (1, -1)
clear variables; close all; clc;

load_function
gamma = 3.5;
epsilon = 0.001;

x1 = 1; y1 = -1;

figure;
[~, k, x_k, y_k] = steepest_descent(f, x1, y1, gamma, epsilon);
fcontour(f, [-2.5, 2.5, -2.5, 2.5]);
hold on;
plot(x_k, y_k)
xlabel('x')
ylabel('y')
plot(x_k(1), y_k(1), 'o', 'color', 'red')
plot(x_k(end), y_k(end), 'x', 'color', 'red')
legend('', 'Path', 'Starting point', 'Point of minimum')
temp_title = sprintf('Steepest Descent for gamma = %.3f', gamma);
title(temp_title)
grid on;
fprintf('For gamma = %.3f, there is(are) %d iteration(s).\n', gamma, k)