close all; clear variables;

load_functions
a1 = -1;
b1 = 3;
n = 100;    % number of different values of lambda to call the function
number_of_calculations_f1 = nan(1, n);
number_of_calculations_f2 = nan(1, n);
number_of_calculations_f3 = nan(1, n);

epsilon = 10^-3;
lambda_values = linspace(10^-2, 1, n);

for i = 1:n
    [~, ~, ~, ~, number_of_calculations_f1(i)] = goldenSection_method(f1, a1, b1, lambda_values(i));
    [~, ~, ~, ~, number_of_calculations_f2(i)] = goldenSection_method(f2, a1, b1, lambda_values(i));
    [~, ~, ~, ~, number_of_calculations_f3(i)] = goldenSection_method(f3, a1, b1, lambda_values(i));
end

figure
subplot(1,3,1)
plot(lambda_values, number_of_calculations_f1)
title('f_1(x)')
grid on;
xlabel('l')
ylabel('function calculations')

subplot(1,3,2)
plot(lambda_values, number_of_calculations_f2)
title('f_2(x)')
grid on;
xlabel('l')
ylabel('function calculations')

subplot(1,3,3)
plot(lambda_values, number_of_calculations_f3)
title('f_3(x)')
grid on;
xlabel('l')
ylabel('function calculations')