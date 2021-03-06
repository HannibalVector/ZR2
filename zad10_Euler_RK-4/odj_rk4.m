function [ x, y ] = odj_rk4( f, y0, a, b, n )
%ODJ_RK4 Summary of this function goes here

    h = (b - a)/n;

    k1 = @(x, y) f(x, y);
    k2 = @(x, y) f(x + h/2, y + h/2 * k1(x, y));
    k3 = @(x, y) f(x + h/2, y + h/2 * k2(x, y));
    k4 = @(x, y) f(x + h, y + h * k3(x, y));
    
    phi = @(x, y) 1/6 * (k1(x, y) + 2*k2(x, y) + 2*k3(x, y) + k4(x, y));

    y = zeros(n+1, 1);
    x = (a:h:b)';
    y(1) = y0;
    
    for i = 1:n
        y(i+1) = y(i) + h*phi(x(i), y(i));
    end
end