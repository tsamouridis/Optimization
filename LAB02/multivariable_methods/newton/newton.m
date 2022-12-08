% VERSION 1
% Newton Algorithm for optimization of a two variable function.
% Parameters:
%   f: the objective function
%   x1, y1: the intial point of search
%   gamma: the constant step for each iteration
%   epsilon: the accuracy of the result
%   check_hessian: boolean variable. if true, the function checks whether 
%       the hessian of f is not positive in any iteration and returns error.
%       Otherwise, the execution continues, but the results are not reliable
% Returns:
%   min_point: the point (x_k,y_k) of minimum value of f. NaN is returned
%        if the algorithms reaches the maximum number of iterations
%   k: the number of iterations
%   x,y: all points from which the algorithm passes while searching the
%        minimum
function [min_point, k, x, y] = newton(f, x1, y1, gamma, epsilon, check_hessian)
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
            if check_hessian
                if ~is_positive_definite(A) 
                    error('Hessian is not positive definite')
                end
            end
            d = - inv(A) * f_jacobian(x(k), y(k));
            x(k+1) = x(k) + gamma*d(1);
            y(k+1) = y(k) + gamma*d(2);
        end
    end
    min_point = nan;
end