function [ X, Y ] = odj_rk4v( f, y0, a, b, n )
%ODJ_RK4V Summary of this function goes here
%   Detailed explanation goes here

    h = (b - a)/n;

    k1 = @(x, y) f(x, y);
    k2 = @(x, y) f(x + h/2, y + h/2 * k1(x, y));
    k3 = @(x, y) f(x + h/2, y + h/2 * k2(x, y));
    k4 = @(x, y) f(x + h, y + h * k3(x, y));
    
    phi = @(x, y) 1/6 * (k1(x, y) + 2*k2(x, y) + 2*k3(x, y) + k4(x, y));

    d = size(y0, 1);
    Y = zeros(d, n+1);
    X = (a:h:b)';
    Y(:, 1) = y0;
    
    for i = 1:n
        Y(:, i+1) = Y(:, i) + h*phi(X(i), Y(:, i));
    end

end

