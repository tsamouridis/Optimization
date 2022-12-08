% VERSION 1
% Steepest Descent Algorithm for optimization of a two variable function.
% Parameters:
%   f: the objective function
%   x1, y1: the intial point of search
%   gamma: the constant step for each iteration
%   epsilon: the accuracy of the result
% Returns:
%   min_point: the point (x_k,y_k) of minimum value of f. NaN is returned
%        if the algorithms reaches the maximum number of iterations
%   k: the number of iterations
%   x,y: all points from which the algorithm passes while searching the
%        minimum
function [min_point, k, x, y] = steepest_descent(f, x1, y1, gamma, epsilon)
    f_derivative = jacobian(f);
    MAX_K = 1000;  % maximum number of iterations
    x = x1;
    y = y1;
    
    for k = 1:MAX_K
        if norm(f_derivative(x(k), y(k))) < epsilon
            min_point = [x(k), y(k)];
            return;
        else
            d = - f_derivative(x(k), y(k));
            x(k+1) = x(k) + gamma*d(1);
            y(k+1) = y(k) + gamma*d(2);
        end
    end
    min_point = nan;
end