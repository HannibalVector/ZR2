function [ dp ] = grab_plijen_funkcija( t, p )
%GRAB_PLIJEN_FUNKCIJA Summary of this function goes here
%   Detailed explanation goes here
alpha1 = 2;
delta1 = 0.02;
alpha2 = 0.0002;
delta2 = 0.8;

dp1 = alpha1 * p(1) - delta1 * p(1) * p(2);
dp2 = alpha2 * p(1) * p(2) - delta2 * p(2);

dp = [dp1; dp2];

end

