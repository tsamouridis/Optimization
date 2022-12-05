% Implementation of the Bisection algorithm for optimization.
% Parameters:
%  f: the objective function
%  a1, b1: the interval in which minimum is being searched
%  lambda: the precision of the returned interval
%  epsilon: the constant used to find the new interval for each loop
% Returns: 
%  interval: an interval containing the minimum of f with precision lambda
%  a, b: arrays containing the values of the intervals used in the loop
%  k: the number of loops performed in the function to calculate the minimum
%  times_f_is_calculated: the number of times a value of function at a specifix x f is calculated
function [interval, a, b, k, times_f_is_calculated] = bisection_method(f, a1, b1, lambda, epsilon)
    if a1 >= b1
        error('a1 must be less than b1.')
    end
    if lambda <= 0 || epsilon < 0
        error('lambda and epsilon must be positive numbers.')
    end
    if lambda < 2*epsilon
        error('Lambda must be more than 2*epsilon')
    end

    a = a1;
    b = b1;
    k = 1;
    times_f_is_calculated = 0;
    while 1
        if abs(b(k) - a(k)) < lambda
            interval = [a(k), b(k)];
            break;
        else
            times_f_is_calculated = times_f_is_calculated + 2;
            x1(k) = (a(k) + b(k))/2 - epsilon;
            x2(k) = (a(k) + b(k))/2 + epsilon;
            if subs(f, x1(k)) < subs(f,x2(k))
                a(k+1) = a(k);
                b(k+1) = x2(k);
            else
                a(k+1) = x1(k);
                b(k+1) = b(k);
            end
        end
        k = k+1;
    end    
end