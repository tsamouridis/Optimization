% VERSION 3
% Leveberg-Marquardt Algorithm for optimization of a two variable function.
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
% In this implementation gamma is chosen by the Armijo Rule
function [min_point, k, x, y, gamma] = levenberg_marquardt_v3(f, x1, y1, epsilon, alpha, beta, s)
    f_jacobian = jacobian(f)';
    f_hessian = hessian(f);
    I = eye(2);
    gamma = nan;
    
    MAX_K = 1000;  % maximum number of iterations
    x = x1;
    y = y1;
    for k = 1:MAX_K
        if norm(f_jacobian(x(k), y(k))) < epsilon
            min_point = [x(k), y(k)];
            return;
        else
            m_k(k) = calculate_m_k(f_hessian, x(k), y(k)); 
            array =  f_hessian(x(k), y(k)) + m_k(k)*I; % the tranformed positive definite hessian
            array_inv = inv(array);
            d = - array_inv * f_jacobian(x(k), y(k));
            [gamma(k), x(k+1), y(k+1)] = armijo(f, f_jacobian, x(k), y(k), d, alpha, beta, s);
        end
    end
    min_point = nan;
end