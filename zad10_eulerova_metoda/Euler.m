function [ x, y ] = Euler( f, y0, a, b, n )
%EULER Summary of this function goes here

    h = (b-a)/n;
    y = zeros(n+1, 1);
    x = (a:h:b)';
    y(1) = y0;
    for i = 1:n
        y(i+1) = y(i) + h*f(x(i), y(i));
    end
end
