function [ yss, Y ] = y_s_param( f, s, a, b, n )
%Y_S Summary of this function goes here
%   Detailed explanation goes here
Y = odj_rk4v(f, s, a, b, n);
yss = Y(:, n+1);

end

