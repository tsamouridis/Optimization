% plots the function f
clear all; close all;

load_function

figure(1);
fsurf(f(x,y), [-15, 15, -5, 5])
title('$ f(x, y) = \frac{1}{3} x^2 + 3y^2 $', 'FontSize', 18, 'interpreter', 'latex')
xlabel('$ x $', 'FontSize', 14, 'interpreter', 'latex')
ylabel('$ y $', 'FontSize', 14, 'interpreter', 'latex')
zlabel('$ f(x,y) $', 'FontSize', 14, 'interpreter', 'latex')

figure(2);
fcontour(f(x,y), [-15, 15, -5, 5])
title('$ f(x, y) = \frac{1}{3} x^2 + 3y^2 $', 'FontSize', 18, 'interpreter', 'latex')
xlabel('$ x $', 'FontSize', 14, 'interpreter', 'latex')
ylabel('$ y $', 'FontSize', 14, 'interpreter', 'latex')
grid on

figure(3);
fill([-10 -10 5 5], [-8 12 12 -8], [145/256, 154/256, 168/256], 'FaceAlpha', 0.7)
hold on
fcontour(f(x,y), [-15, 15, -15, 15])
title('$ f(x, y) = \frac{1}{3} x^2 + 3y^2 $', 'FontSize', 18, 'interpreter', 'latex')
xlabel('$ x $', 'FontSize', 14, 'interpreter', 'latex')
ylabel('$ y $', 'FontSize', 14, 'interpreter', 'latex')
hold on;
grid on
legend('Constraints')
