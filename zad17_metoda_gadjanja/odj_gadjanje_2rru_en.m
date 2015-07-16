function [ x, y, s ] = odj_gadjanje_2rru_en( f, dfy, dfdy, a, b, alpha, beta, s0, n )
%ODJ_GADJANJE_2RRU Summary of this function goes here
%   Detailed explanation goes here

f_sustav = @(x, y) [y(2); f(x, y(1), y(2)); y(4); dfy(x, y(1), y(2))*y(3) + dfdy(x, y(1), y(2))*y(4)];


FdF = @(s) F_en(s, f_sustav, a, b, alpha, beta, n);

s = Newton_egzaktni(FdF, s0);

[~, ~, x, y] = F_en(s, f_sustav, a, b, alpha, beta, n); 
y = y(1, :)';

end

