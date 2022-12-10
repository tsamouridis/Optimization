% plots the function f(x,y)
clear variables; close all;

load_function

figure;
fsurf(f)
title('f(x,y) = x^5 \cdot e^{-x^2-y^2}')
xlabel('x')
ylabel('y')
zlabel('f(x,y)')

figure;
fcontour(f)
title('f(x,y) = x^5 \cdot e^{-x^2-y^2}')
xlabel('x')
ylabel('y')
grid on

figure;
fcontour(f, [-2.5, 2.5, -2.5, 2.5])
title('f(x,y) = x^5 \cdot e^{-x^2-y^2}')
xlabel('x')
ylabel('y')
grid on
hold on;
plot(0,0, 'ro')
plot(-1,1, 'r^')
plot(1,-1, 'r>')
legend('', '(0,0)', '(-1,1)', '(1,-1)')





