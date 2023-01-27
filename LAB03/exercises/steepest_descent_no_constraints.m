% Steepest Descent algorithm for the f function for different constant values
% of gamma.
% IMPORTANT: Select starting point before execution
clear variables; close all; clc;

load_function
gamma = [0.1, 0.3, 3, 5];
epsilon = 0.001;

% Select one of the following three lines and comment out the rest
% x1 = -100; y1 = -100; plot_limits = [-100, 100, -100, 100];
x1 = 4; y1 = 5; plot_limits = [-6 6 -6 6];
% x1 = 5; y1 = 0; plot_limits = [-6 6 -6 6];

figure;
temp_sgtitle = sprintf('Steepest Descent algorithm. Starting point: (%d, %d)', x1, y1);
sgtitle(temp_sgtitle)
for i = 1:length(gamma)
    [~, k, x_k, y_k] = steepest_descent(f, x1, y1, gamma(i), epsilon);
    subplot(2, 2, i)
    fcontour(f, plot_limits);
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