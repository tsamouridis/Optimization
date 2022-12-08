function [gamma, x2, y2] = armijo(f, f_derivative, x1, y1, d)
    alpha = 0.001;
    beta = 0.2;
    s = 1;
    m = 0;
    while true
        gamma = s*beta^m;
        x2 = x1 + gamma*d(1);
        y2 = y1 + gamma*d(2);
        w1 = f(x1, y1);
        w2 = f(x2, y2) - alpha*beta^m*s*(d)'*f_derivative(x1, y1);
        if w1 >= w2
            break
        end
        m = m+1;
    end
end




