function [ x, y ] = odj_pred_kor( f, a, b, y0, n, m )
%ODJ_PRED_KOR Summary of this function goes here
%   Detailed explanation goes here
addpath ../zad10_Euler_RK-4/

h = (b - a) / n;
x = (a:h:b)';
y = zeros(n+1, 1);

[x_rk, y_rk] = odj_rk4(f, y0, a, a + 3*h, 3);
f_prosli = f(x_rk, y_rk);
y(1:4) = y_rk;

for i=4:n
y1 = y(i) + h*AdamsBashforth4(f_prosli);
    for j=1:m
        f1 = [f_prosli(2:4); f(x(i+1), y1)];
        y1 = y(i) + h*AdamsMoulton3(f1);
    end
    f_prosli = [f_prosli(2:4); f(x(i+1), y1)];
    y(i+1) = y1;
end


end

