% Tests the Newton algorithm for gamma derived with the Armijo Rule.
% Plots the convergence of the method in a contour plot and prints the
% iterations used by the algorithm. It also plots the values of gamma, if
% the algorithm converges.
% IMPORTANT: Starting point and Armijo Rule parameters must be defined before
% 	the execution.
clear variables; close all; clc;

load_function
epsilon = 0.001;
% f(x,y) = (x-1)^2 + (y-2)^4 + 3;
% Comment out the unwanted parameters and keep one of the 2 following 
% lines to get the desired results:
alpha = 0.001; beta = 0.2; s = 1; flag = 1;
% alpha = 0.01; beta = 0.5; s = 0.5; flag = 2;
% alpha = 0.001; beta = 0.5; s = 1; flag = 3;

% Comment out the unwanted starting points and keep one of the 3 following 
% lines to get the desired results:
% x1 = 0; y1 = 0;
x1 = -1; y1 = 1;
% x1 = 1; y1 = -1;

figure;
temp_sgtitle = sprintf('case %d', flag);
sgtitle(temp_sgtitle)
subplot(1,2,1)
[~, k, x_k, y_k, gamma_k] = newton_v3(f, x1, y1, epsilon, alpha, beta, s);
fcontour(f, [-2.5, 2.5, -2.5, 2.5]);
hold on;
plot(x_k, y_k)
xlabel('x')
ylabel('y')
plot(x_k(1), y_k(1), 'o', 'color', 'red')
plot(x_k(end), y_k(end), 'x', 'color', 'red')
legend('', 'Path', 'Starting point', 'Point of minimum')
temp_title = sprintf('Newton Algorithm with Armijo Rule');
grid on;
fprintf('There are %d iterations.\n', k)

% gamma_k is NaN when the execution of the method ends before assigning any
% value in gamma
if ~isnan(gamma_k)
    iteration = 1:k-1;
    subplot(1,2,2)
    plot(iteration, gamma_k, '-o');
    title('Values of \gamma in each iteration')
    xlabel('Iteration')
    ylabel('\gamma')
    grid on
end