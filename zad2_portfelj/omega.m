function [ omega_min, omega_povrat ] = omega( x1, x2, m, ocekivani_povrat )
    e = ones(size(m));
    omega_min = x2 / (e'*x2);
    omega_povrat = (m'*x1 - ocekivani_povrat*e'*x1)*x2 + (ocekivani_povrat*e'*x2-e'*x1)*x1;
    omega_povrat = omega_povrat / ((e'*x2)*(m'*x1)-(e'*x1)^2);
end

