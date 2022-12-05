% plots the function f
clear variables; close all;

load_function

figure;
fsurf(f)
title('f = x^5*e^{-x^2-y^2}')
xlabel('x')
ylabel('y')
zlabel('f(x,y)')

figure;
fcontour(f)
title('f = x^5*e^{-x^2-y^2}')
xlabel('x')
ylabel('y')
grid on

figure;
fcontour(f, [-2.5, 2.5, -2.5, 2.5])
title('f = x^5*e^{-x^2-y^2}')
xlabel('x')
ylabel('y')
grid on
hold on;
plot(0,0, 'x')
plot(-1,1, 'o')
plot(1,-1, '+')
legend('', '(0,0)', '(-1,1)', '(1,-1)')





