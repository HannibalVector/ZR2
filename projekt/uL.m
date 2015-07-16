function [ uL, u ] = uL( L, spline_coeff, n )
%UL Summary of this function goes here
%   Detailed explanation goes here
xx = linspace(0, L, size(spline_coeff, 1))';
rho_spline = spline(xx, spline_coeff);

[k, dk] = kappa(L, n, rho_spline);
h = L/n;

alpha = 2*k - h*dk;
beta = -4*k;
gamma = 2*k + h*dk;

A = diag(alpha(2:n), -1) + diag(gamma(1:n-1), 1) + diag(beta);
A(n, n-1) = 2*k(n);
A(n, n) = -(2*k(n) + 0.01*h*h*dk(n) + 2*0.01*h*k(n));

b = zeros(n, 1);
b(1) = -850*alpha(1);

u = A\b;
uL = u(n);

end

