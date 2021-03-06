function [ A, c, x ] = odj_diferencije_Ac( q, g, a, b, alpha, beta, n )
%ODJ_DIFERENCIJE_AC Summary of this function goes here
%   Detailed explanation goes here

h = (b-a)/(n+1);
x = linspace(h, b-h, n)';

c = g(x);
c(1) = c(1) + alpha/h^2;
c(n) = c(n) + beta/h^2;

Q = q(x);
A = (2*eye(n) + h^2 * diag(Q) + diag(-1*ones(n-1, 1), -1) + diag(-1*ones(n-1, 1), 1))/h^2;

end

