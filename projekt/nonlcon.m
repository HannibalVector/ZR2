function [ c, ceq ] = nonlcon( y )
%NONLCON Summary of this function goes here
%   Detailed explanation goes here
s = size(y, 1);
n = 200;
c = uL(y(s), y(1:s-1), n) - 375;
ceq = 0;

L = y(s);
X = linspace(0, L, 100);
Y = spline(linspace(0, L, s-1), y(1:s-1), X);

c = [c; -Y'; Y'-1];

end

