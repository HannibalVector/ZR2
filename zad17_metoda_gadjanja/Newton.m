function [ s ] = Newton( F, s0 )
%NEWTON Summary of this function goes here
%   Detailed explanation goes here

eps = 1.0e-8;
s = s0;
n = 0;

while (abs(F(s)) > eps)
s = s - F(s)/dF(F, s);
n = n+1;
end

sprintf('Newton iskonvergirao u n = %d koraka', n)


end

