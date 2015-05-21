f = @(x, y) (-y - 5*exp(-x).*sin(5*x));

y_exact = @(x) exp(-x).*cos(5*x);

a = 0; b = 3;
y0 = 1;

n = 30; m = 5;

fplot(y_exact, [a b], 'k-');
hold on

[x, y] = odj_pred_kor(f, a, b, y0, n, m);
plot(x, y, 'ro')
legend('aproksimativno rjesenje', 'egzaktno rjesenje')