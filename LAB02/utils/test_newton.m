% tests the different algorithms f the Newton method by plotting the
% results in a contour plot. For the testing function h is used. h(x,y) has
% positive definite Hessian array allowing the use of Newton method
clear all; clc; close all;

syms x;
syms y;
h(x, y) = (x-2)^2 + (y+3)^2 +4;
x1 = -4;
y1 = 1;
gamma = 0.1;
epsilon = 0.001;
check_hessian = true;
figure;

[~, ~, x_k, y_k] = newton(h, x1, y1, gamma, epsilon, check_hessian);
subplot(3,1,1)
fcontour(h);
hold on
plot(x_k, y_k);
plot(x_k(1), y_k(1), 'o')
plot(x_k(end), y_k(end), 'x')
title('Constant \gamma')
ylabel('y')
xlabel('x')

[~, ~, x_k, y_k] = newton_v2(h, x1, y1, epsilon);
subplot(3,1,2)
fcontour(h);
hold on
plot(x_k, y_k);
plot(x_k(1), y_k(1), 'o')
plot(x_k(end), y_k(end), 'x')
title('Mutable \gamma')
ylabel('y')
xlabel('x')

alpha = 0.001; beta = 0.2; s = 1;
[~, ~, x, y] = newton_v3(h, x1, y1, epsilon, alpha, beta, s);
subplot(3,1,3)
fcontour(h);
hold on
plot(x_k, y_k);
plot(x_k(1), y_k(1), 'o')
plot(x_k(end), y_k(end), 'x')
title('\gamma defined by Armijo Rule')
ylabel('y')
xlabel('x')

