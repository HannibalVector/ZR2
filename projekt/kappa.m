function [ k, dk ] = kappa( L, n, rho_spline )
%KAPPA Summary of this function goes here
%   Detailed explanation goes here
    h = L/n;
    rho = ppval(rho_spline, linspace(h, L, n));
    k = 4*rho.^2 - 5*rho + 2;
    dk = 8*rho - 5;
end

