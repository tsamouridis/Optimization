% VERSION 3
% Newton Algorithm for optimization of a two variable function.
% Parameters:
%   f: the objective function
%   x1, y1: the intial point of search
%   epsilon: the accuracy of the result
% Returns:
%   min_point: the point (x_k,y_k) of minimum value of f. NaN is returned
%        if the algorithms reaches the maximum number of iterations
%   k: the number of iterations
%   x,y: all points from which the algorithm passes while searching the
%        minimum
%   gamma: values of gamma in each iteration
% In this implementation gamma is chosen by the Armijo Rule.
% The Hessian array must be positive definite in order for the Armijo Rule
% to work properly.
function [min_point, k, x, y, gamma] = newton_v3(f, x1, y1, epsilon, alpha, beta, s)
    f_jacobian = (jacobian(f))';
    f_hessian = hessian(f);
    MAX_K = 1000;  % maximum number of iterations
    x = x1;
    y = y1;
    
    for k = 1:MAX_K
        if norm(f_jacobian(x(k), y(k))) < epsilon
            min_point = [x(k), y(k)];
            return; 
        else
            A = f_hessian(x(k), y(k));
            if ~is_positive_definite(A) 
                error('Hessian is not positive definite')
            end
            d = - inv(A) * f_jacobian(x(k), y(k));
            [gamma(k), x(k+1), y(k+1)] = armijo(f, f_jacobian, x(k), y(k), d, alpha, beta, s);
        end
    end
    min_point = nan;
end








