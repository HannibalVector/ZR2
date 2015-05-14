function [ X, Y ] = odj_rk2( f, y0, a, b, n )
%ODJ_RK2 Summary of this function goes here
%   Detailed explanation goes here

    k1 = @(x, y) f(x, y);
    k2 = @(x, y, h) f(x + h/4, y + h/4*k1(x, y));
    k3 = @(x, y, h) f(x + 27/40*h, y + h*(-189/800*k1(x, y) + 729/800*k2(x, y, h)));
    
    phi2 = @(x, y, h) 214/891*k1(x, y) + 1/33*k2(x, y, h) + 650/891*k3(x, y, h);
    
    h = (b - a)/n;
    X = (a:h:b)';
    Y = zeros(n+1, 1);
    
    Y(1) = y0;
    for i = 1:n
        Y(i+1) = Y(i) + h*phi2(X(i), Y(i), h);
    end
end

