function [ dF ] = dF( F, s )
%DF Summary of this function goes here
%   Detailed explanation goes here
eps = sqrt(1.0e-4);
ds = eps*s;
dF = (F(s + ds) - F(s)) / ds;

end

