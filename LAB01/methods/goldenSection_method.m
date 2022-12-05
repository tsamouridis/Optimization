% Implementation of the Golden Section algorithm for optimization.
% Parameters:
%  f: the objective function
%  a1, b1: the interval in which minimum is being searched
%  lambda: the precision of the returned interval
% Returns: 
%  interval: an interval containing the minimum of f with precision lambda
%  a, b: arrays containing the values of the intervals used in the loop
%  k: the number of loops performed in the function to calculate the minimum
%  times_f_is_calculated: the number of times a value of function f at a specific x is calculated
function [interval, a, b, k, times_f_is_calculated] = goldenSection_method(f, a1, b1, lambda)
    if a1 >= b1
        error('a1 must be less than b1.')
    end
    if lambda <= 0
        error('lambda  must be a positive number.')
    end

    a = a1;
    b = b1;
    gamma = 0.618;
    x1 = a1 + (1-gamma)*(b1 - a1);
    x2 = a1 + gamma*(b1 - a1);
    k = 1;
    f_x1k = subs(f, x1);
    f_x2k = subs(f, x2);
    times_f_is_calculated = 2;
    while 1
        if abs(b(k) - a(k)) < lambda
            interval = [a(k), b(k)];
            break;
        elseif f_x1k > f_x2k
            a(k+1) = x1(k);
            b(k+1) = b(k);
            x2(k+1) = a(k+1) + gamma*(b(k+1) - a(k+1));
            x1(k+1) = x2(k);
            f_x1k = f_x2k;
            f_x2k = subs(f, x2(k+1));
            times_f_is_calculated = times_f_is_calculated+1;
        elseif f_x1k <= f_x2k %maybe else here instead of elseif
            a(k+1) = a(k);
            b(k+1) = x2(k);
            x2(k+1) = x1(k);
            x1(k+1) = a(k+1) + (1-gamma)*(b(k+1) - a(k+1));
            f_x2k = f_x1k;
            f_x1k = subs(f, x1(k+1));
            times_f_is_calculated = times_f_is_calculated+1;
        end
        k = k+1;
    end
end