function m_k = calculate_m_k(f_hessian, x, y)
    step = 0.01;
    m_k = 0;  % if m_k = 0, we get the Newton method
    I = diag([1,1]);
    array = f_hessian(x,y) + m_k*I;
    while ~is_positive_definite(array)
        m_k = m_k + step;
        array = f_hessian(x,y) + m_k*I;
    end
end