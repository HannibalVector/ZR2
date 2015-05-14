function [ x, y ] = odj_impl_trapez( f, a, b, y0, n )
%ODJ_IMPL_TRAPEZ Summary of this function goes here
%   Detailed explanation goes here

h = (b-a)/n;
x = (a:h:b)';

y = zeros(n+1, 1);
y(1) = y0;

k = 5;


for i = 1:n
   z = @(y1) y1 - y(i) - h/2 * (f(x(i), y(i)) + f(x(i+1), y1)); 
   y(i+1) = odj_newton(z, differentiate(z), y(i), k);
end




end

