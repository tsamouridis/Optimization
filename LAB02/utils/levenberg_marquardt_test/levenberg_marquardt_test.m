% Tests the Levenberg-Marquardt algorithm for constant values of step gamma.
% Plots the convergence of the method in a contour plot and prints the
% iterations used by the algorithm. 
% IMPORTANT: Starting point must be defined before the execution.
clear variables; close all; clc;

load_function
gamma = [0.001, 0.01, 0.05, 0.1];
% gamma = 0.4;
% gamma = [0.01, 0.1, 1, 2];
epsilon = 0.001;

% Comment out the unwanted starting points and keep one of the 3 following 
% lines to get the desired results:
% x1 = 0; y1 = 0;
% x1 = -1; y1 = 1;
x1 = 1; y1 = -1;

figure;
sgtitle('Levenberg-Marquardt algorithm for constant \gamma')
for i = 1:length(gamma)
    [~, k, x_k, y_k] = levenberg_marquardt(f, x1, y1, gamma(i), epsilon);
    subplot(2, 2, i)
    fcontour(f, [-2.5, 2.5, -2.5, 2.5]);
    hold on;
    plot(x_k, y_k)
    xlabel('x')
    ylabel('y')
    plot(x_k(1), y_k(1), 'o', 'color', 'red')
    plot(x_k(end), y_k(end), 'x', 'color', 'red')
    legend('', 'Path', 'Starting point', 'Point of minimum')
    temp_title = sprintf('gamma = %.3f', gamma(i));
    title(temp_title)
    grid on;
    fprintf('For gamma = %.3f, there is(are) %d iteration(s).\n', gamma(i), k)
end