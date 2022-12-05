% plots the functions f1, f2, f3
close all; 

load_functions
x_limits = [-2 4];
functions_to_plot = [f1, f2, f3];
for f = functions_to_plot
    figure
    fplot(f, x_limits)
    hold on
    xline(-1, 'red', 'x = -1')
    xline(3, 'red', 'x = 3')
    ylim([-10 40])
    grid on
    xlabel('x')
    ylabel('y')
end

font_size = 13;
figure(1)
title('f_1(x) = (x-2)^2 + x\cdot ln(x+3)', 'FontSize', font_size)

figure(2)
title('f_2(x) = 5^x + (2-cos(x))^2', 'FontSize', font_size)

figure(3)
title('f_3(x) = e^x\cdot (x^3-1) + (x-1)sin(x)', 'FontSize', font_size)
