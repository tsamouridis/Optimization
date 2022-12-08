clear variables; close all;

load_function
epsilon = 0.001;
check_hessian = false;


% comment out the unwanted starting points and keep one of the 3 following 
% lines to get the desired results:
% x1 = 0; y1 = 0;
x1 = -1; y1 = 1;
% x1 = 1; y1 = -1;

figure;
[x_star, k, x_k, y_k, gamma_k] = newton_v2(f, x1, y1, epsilon, check_hessian);
fcontour(f, [-2.5, 2.5, -2.5, 2.5]);
hold on;
plot(x_k, y_k)
plot(x_k(1), y_k(1), 'o', 'color', 'red')
plot(x_k(end), y_k(end), 'x', 'color', 'red')
legend('', 'Path', 'Starting point', 'Point of minimum')
temp_title = sprintf('Steepest descent for mutable gamma');
title(temp_title)
grid on;
fprintf('There are %d iterations.\n', k)

iteration = 1:k-1;
figure()
plot(iteration, gamma_k);
title('Values of \gamma in each iteration')
xlabel('Iteration')
ylabel('\gamma')
grid on