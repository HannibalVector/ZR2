function [ x, y, s ] = odj_gadjanje_2rru( f, a, b, alpha, beta, s0, n )
%ODJ_GADJANJE_2RRU Summary of this function goes here
%   Detailed explanation goes here

F = @(s) F_param(s, f, a, b, alpha, beta, n);

s = Newton(F, s0);

[~,  x, y] = F_param(s, f, a, b, alpha, beta, n); 
y = y(1, :)';

end

