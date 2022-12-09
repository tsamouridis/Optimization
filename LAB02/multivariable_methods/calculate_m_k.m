% Calculates m_k parameter for the Levenberg-Marquardt Algorithm. m_k is
% increased with step 0.01, starting from zero, untill the Levenberg-Marquardt
% array is positive definite
% Parameters:
%   f_hessian: the hessian array of f
%   x,y: the current point of the iteration
function m_k = calculate_m_k(f_hessian, x, y)
    step = 0.01;
    m_k = 0;  % if m_k = 0, Newton method is obtained
    I = diag([1,1]);
    array = f_hessian(x,y) + m_k*I;
    while ~is_positive_definite(array)
        m_k = m_k + step;
        array = f_hessian(x,y) + m_k*I;
    end
end