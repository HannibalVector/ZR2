function [ omega_min, omega_povrat ] = portfelj( C, m, ocekivani_povrat )
%PORTFELJ Summary of this function goes here
%   Detailed explanation goes here

    N = size(m);
    e = ones(N, 1);
    x0 = zeros(N, 1);
    
    [x1, ~, res1] = sor(C, m, x0, 1.0e-8, 1.2);
    [x2, ~, res2] = sor(C, e, x0, 1.0e-8, 1.2);
    plot(res1);
    hold on;
    plot(res2);
    
    
    omega_min = x2 / (e'*x2);
    omega_povrat = (m'*x1 - ocekivani_povrat*e'*x1)*x2 + (ocekivani_povrat*e'*x2-e'*x1)*x1;
    omega_povrat = omega_povrat / ((e'*x2)*(m'*x1)-(e'*x1)^2);

end