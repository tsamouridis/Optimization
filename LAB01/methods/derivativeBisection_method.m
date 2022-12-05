% Implementation of the Bisection algorithm with the use of derivatives for optimization.
% Parameters:
%  f: the objective function
%  a1, b1: the interval in which minimum is being searched
%  lambda: the precision of the returned interval
% Returns: 
%  result: an interval containing the minimum of f with precision lambda or
%  the minimum itself
%  a, b: arrays containing the values of the intervals used in the loop
%  k: the number of loops performed in the function to calculate the minimum
%  times_f_is_calculated: the number of times a value of function f at a specific x is calculated
function [result, a, b, k, times_f_derivative_is_calculated] = derivativeBisection_method(f, a1, b1, lambda)

    result = nan;
    a = a1;
    b = b1;
    f_derivative = diff(f, 1);
    n = calculate_n(a1, b1, lambda);
    times_f_derivative_is_calculated = 0;
    for k = 1:n
        x1(k) = (a(k) + b(k))/2;
        f_derivative_x1k = subs(f_derivative, x1(k));
        times_f_derivative_is_calculated = times_f_derivative_is_calculated + 1;
        if abs(f_derivative_x1k) < 10^(-4)    %practically zero
            result = x1(k);
            break;
        elseif f_derivative_x1k > 0
            a(k+1) = a(k);
            b(k+1) = x1(k);
        elseif f_derivative_x1k < 0
            b(k+1) = b(k);
            a(k+1) = x1(k);
        end
    end   
    if isnan(result)    % if f_derivative(x1(k)) was calculated to not be 0 give an interval as result
        result = [a(k), b(k)];
    end
end
       
function n = calculate_n(a1, b1, lambda)
    n = 1;
    while 1
        if (1/2)^n <= lambda/(b1 - a1)
            break;
        else
            n = n+1;
        end
    end
end