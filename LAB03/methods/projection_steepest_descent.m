% Steepest Descent Algorithm with projection for optimization of a two variable
% function with constraints.
% Parameters:
%   f: the objective function
%   x1, y1: the intial point of search
%   limits: the boundaries of contraints stored column-wise
%   gamma, s: the constant steps for each iteration
%   epsilon: the accuracy of the result
% Returns:
%   x,y: all points from which the algorithm passes while searching the
%        minimum
%   x_bar, y_bar: the results of the projection in each iteration
function [x, y, x_bar, y_bar] = projection_steepest_descent(f, x1, y1, limits, gamma, s, epsilon)
    f_jacobian = jacobian(f);
    x = projection(x1, limits(:, 1));
    y = projection(y1, limits(:, 2));
    MAX_K = 2000;
    for k = 1:MAX_K
        if norm(f_jacobian(x(k), y(k))) < epsilon 
            return
        else
            d = - f_jacobian(x(k), y(k));
            x_bar(k) = projection(x(k) + s*d(1), limits(:, 1));
            y_bar(k) = projection(y(k) + s*d(2), limits(:, 2));

            x(k+1) = x(k) + gamma*(x_bar(k) - x(k));
            y(k+1) = y(k) + gamma*(y_bar(k) - y(k));
            
            if abs(x(k+1) - x(k)) < 10^(-5) && abs(y(k+1) - y(k)) < 10^(-5)
                return
            end
        end
    end
end

