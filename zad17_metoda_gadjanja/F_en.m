function [ F, dF, x, y ] = F_en( s, f, a, b, alpha, beta, n )
%F Summary of this function goes here
%   Detailed explanation goes here

[x, y] = odj_rk4v(f, [alpha; s; 0; 1], a, b, n);
F = y(1, n+1) - beta;
dF = y(3, n+1);

end

