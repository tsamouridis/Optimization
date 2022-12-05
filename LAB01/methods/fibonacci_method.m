% Implementation of the Fibonacci algorithm for optimization.
% Parameters:
%  f: the objective function
%  a1, b1: the interval in which minimum is being searched
%  lambda: the precision of the returned interval
% Returns: 
%  interval: an interval containing the minimum of f with precision lambda
%  a, b: arrays containing the values of the intervals used in the loop
%  k: the number of loops performed in the function to calculate the minimum
%  times_f_is_calculated: the number of times a value of function f at a specific x is calculated
function [interval, a, b, k, times_f_is_calculated] = fibonacci_method(f, a1, b1, lambda)
    if a1 >= b1
        error('a1 must be less than b1.')
    end
    if lambda <= 0
        error('lambda  must be a positive number.')
    end
    
    a = a1;
    b = b1;
    n = calculate_n(a1, b1, lambda);
    x1(1) = a(1) + fibonacci(n-2)/fibonacci(n)*(b(1) - a(1));
    x2(1) = a(1) + fibonacci(n-1)/fibonacci(n)*(b(1) - a(1));
    f_x1k = subs(f, x1);
    f_x2k = subs(f, x2);
    times_f_is_calculated = 2;
    for k = 1:n-2
        if k == n-2
%             x1(n) = x1(n-1);
%             x2(n) = x2(n-1);
            if subs(f, x1(n-2)) > subs(f, x2(n-2))
                a(n-1) = x1(n-2);
                b(n-1) = b(n-1);
            else
                a(n-1) = a(n-2);
                b(n-1) = x2(n-2);
            end
            times_f_is_calculated = times_f_is_calculated+2;
            interval = [a(n-1), b(n-1)];
            break;
        end
        if f_x1k >= f_x2k
            a(k+1) = x1(k);
            b(k+1) = b(k);
            x1(k+1) = x2(k);
            x2(k+1) = a(k+1) + fibonacci(n-k-1)/fibonacci(n-k)*(b(k+1) - a(k+1));
            f_x1k = f_x2k;
            f_x2k = subs(f, x2(k+1));
            times_f_is_calculated = times_f_is_calculated+1;
        else
            a(k+1) = a(k);
            b(k+1) = x2(k);
            x2(k+1) = x1(k);
            x1(k+1) = a(k+1) + fibonacci(n-k-2)/fibonacci(n-k)*(b(k+1) - a(k+1));
            f_x2k = f_x1k;
            f_x1k = subs(f, x1(k+1));
            times_f_is_calculated = times_f_is_calculated+1;
        end
    end
end

function n = calculate_n(a1, b1, lambda)
    n = 1;
    while 1
        if fibonacci(n) > (b1 - a1)/lambda
            break;
        else
            n = n+1;
        end
    end
end

            
            
            