function [ x, Y ] = rk4_matrix( T, Y0, a, b, n)
%RK4_MATRIX Summary of this function goes here
%   Detailed explanation goes here

f = @(x, y) T(x)*y;
dim = size(Y0, 1);
Y = zeros(dim, dim, n+1);

for i = 1:dim
   [y, x] = odj_rk4v(f, Y0(:, i), a, b, n);
   Y(:, i, :) = y;  
end

end

