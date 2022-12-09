% Implementation of the Armijo Rule for the calculation of step gamma. 
% Parameters:
%   f: the objective function
%   f_jacobian:the jacobian of f
%   x1, y1: the current point of iteration
%   d: the direction vector
%    alpha, beta, s: the parameters of the Armijo Rule
% Returns:
%   gamma: the step calculated by the Armijo Rule
%   x2, y2: the next point of the iteration 
function [gamma, x2, y2] = armijo(f, f_jacobian, x1, y1, d, alpha, beta, s)
    m = 0;
    gamma = s*beta^m;
    x2 = x1 + gamma*d(1);
    y2 = y1 + gamma*d(2);
    while f(x1, y1) - f(x2, y2) < alpha*beta^m*s*(d)'*f_jacobian(x1, y1)
        gamma = s*beta^m;
        x2 = x1 + gamma*d(1);
        y2 = y1 + gamma*d(2);
        m = m+1;
    end
end




