function [ z ] = odj_newton( f, df, z0, k )
%ODJ_NEWTON Summary of this function goes here
%   Detailed explanation goes here
z = z0;    

for i = 1:k
       z = z - f(z)/df(z);         
end
end

