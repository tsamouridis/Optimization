% Steepest Descent algorithm with projection visualization for the f function
% for different constant values of gamma and s.
% IMPORTANT: exercise variable must have a value(2 or 3 or 4) defined by the user
clear all; close all;

load_function
exercise = 4;

if exercise == 2
    s = 5;
    gamma = 0.5;
    x1 = 5; y1 = -5;
elseif exercise == 3
    s = 15;
    gamma = 0.1;
    x1 = -5; y1 = 10;
elseif exercise == 4
    s = 0.1;
    gamma = 0.2;
    x1 = 8; y1 = -10;
else
    error('exercise must be 2,3 or 4.\n')
end

epsilon = 0.01;
limits = [-10, -8;
            5, 12 ];
        
figure;
fill([limits(1,1) limits(1,1) limits(2,1) limits(2,1)], [limits(1,2) limits(2,2) limits(2,2) limits(1,2)], [145/256, 154/256, 168/256], 'FaceAlpha', 0.7)
hold on
fcontour(f(x,y), [-15, 15, -15, 15])
title('$ f(x, y) = \frac{1}{3} x^2 + 3y^2 $', 'FontSize', 18, 'interpreter', 'latex')
xlabel('$ x $', 'FontSize', 14, 'interpreter', 'latex')
ylabel('$ y $', 'FontSize', 14, 'interpreter', 'latex')
grid on

[x_k, y_k] = projection_steepest_descent(f, x1, y1, limits, gamma, s, epsilon);

hold on;
plot(x_k, y_k, 'red')
plot(x_k(1), y_k(1), 'ro')
plot(x_k(end), y_k(end), 'rx')
legend('Constraints Region', '', 'Path', 'Starting Point', 'Point of minimum')

k = length(x_k);
figure;
plot(1:k, x_k, 'o')
hold on
plot(1:k, y_k, 'x')
legend('x', 'y')
xlabel('iteration')
title('Values of x and y coordinates in each iteration')

k = length(x_k);
fprintf('k = %d\n', k);
fprintf('x_min = %f\n',x_k(end))
fprintf('y_min = %f\n',y_k(end))