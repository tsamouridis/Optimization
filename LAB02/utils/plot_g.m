% plots the function g(x) = f(x,0)
clear variables; close all;

load_function

figure;
fsurf(f)
xlabel('x')
ylabel('y')
zlabel('f(x,y)')
hold on
g(x) = f(x,0);
fplot3(x, 0*x, g(x), 'red', 'linewidth', 3);
legend('f(x,y)', 'g(x)')

figure;
fplot(g(x))
title('g(x) = f(x,0) = x^5 \cdot e^{-x^2}')
xlabel('x')
ylabel('g(x)')
grid on

