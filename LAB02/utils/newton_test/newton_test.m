clear variables; close all;

load_function
gamma = [0.01, 0.1, 1, 2];
epsilon = 0.001;
check_hessian = false;

% comment out the unwanted starting points and keep one of the 3 following 
% lines to get the desired results:
% x1 = 0; y1 = 0;
x1 = -1; y1 = 1;
% x1 = 1; y1 = -1;

figure;
for i = 1:length(gamma)
    [x_star, k, x_k, y_k] = newton(f, x1, y1, gamma(i), epsilon, check_hessian);
    subplot(2, 2, i)
    fcontour(f, [-2.5, 2.5, -2.5, 2.5]);
    hold on;
    plot(x_k, y_k)
    plot(x_k(1), y_k(1), 'o', 'color', 'red')
    plot(x_k(end), y_k(end), 'x', 'color', 'red')
    legend('', 'Path', 'Starting point', 'Point of minimum')
    temp_title = sprintf('Newton Method for gamma = %.2f', gamma(i));
    title(temp_title)
    grid on;
    fprintf('For gamma = %.2f, there are %d iterations.\n', gamma(i), k)
end