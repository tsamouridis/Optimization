function m = armijo(f, f_derivative, x1, x2, d)
    alpha = 10^(-3);
    beta = 0.2;
    s = 1;
    m = 1;
    while true
        if f(x1) - f(x2) >= -alpha*beta^m*s*(d)'*f_derivative(x1)
            break
        end
    end
end




