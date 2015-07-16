function [ F, x, y ] = F_param( s, f, a, b, alpha, beta, n )
%F Summary of this function goes here
%   Detailed explanation goes here

[x, y] = odj_rk4v(f, [alpha; s], a, b, n);
F = y(1, n+1) - beta;


end

