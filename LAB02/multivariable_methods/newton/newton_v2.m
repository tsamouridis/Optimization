% VERSION 2
% Newton Algorithm for optimization of a two variable function.
% Parameters:
%   f: the objective function
%   x1, y1: the intial point of search
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
%   gamma: the values of gamma in each iteration
% In this implementation gamma is chosen by the minimization in respect to
% gamma of the expression: phi(gamma) = f(x_k + gamma_k*d_k)
function [min_point, k, x, y, gamma] = newton_v2(f, x1, y1, epsilon, check_hessian)
    syms sym_gamma; %symbolic gamma, used for the minimization of the pfi(gamma)
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
%%%% check this again
%             values = f_jacobian(x(k), y(k)); % values of f_jacobian at (x(k), y(k))
%             phi = f( x(k) - sym_gamma*values(1), y(k) - sym_gamma*values(2) );
            phi = f( x(k) + sym_gamma*d(1), y(k) + sym_gamma*d(2) );
            gamma(k) = mean(goldenSection_method(phi, 0, 3, 0.0001));
            
            x(k+1) = x(k) + gamma(k)*d(1);
            y(k+1) = y(k) + gamma(k)*d(2);
        end
    end
    min_point = nan;
end








