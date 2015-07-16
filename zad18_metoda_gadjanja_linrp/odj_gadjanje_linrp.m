function [ x, y, s ] = odj_gadjanje_linrp( T, g, A, B, c, a, b, n )
%ODJ_GADJANJE_LINRP Summary of this function goes here
%   Detailed explanation goes here

dim = size(A, 1);

f = @(x, y) T(x)*y + g(x);

y_s = @(s) y_s_param(f, s, a, b, n);
[x, Y] = rk4_matrix(T, eye(dim), a, b, n);

y0 = zeros(dim, 1);
[y_s0, Y_s0] = y_s(y0);

ss = 10*rand(dim, 1);

F = @(s) (A + B*Y(:, :, n+1))*s+B*y_s0-c;

y_ss = y_s(ss);
ds = 0.01;
Ds = ds*eye(dim);


Z = zeros(dim);
for i = 1:dim
Z(:, i) = (y_s(ss + Ds(:, i)) - y_ss)/ds;
end

dF = A + B*Z;

s = ss - dF\F(ss);

y = zeros(dim, n+1);
for i = 1:n+1
y(:, i) = Y(:, :, i)*s + Y_s0(:, i);
end

end