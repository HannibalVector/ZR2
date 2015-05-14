f = @(x, y) (-y - 5*exp(-x).*sin(5*x));

a = 0; b = 3;
y0 = 1;

n = 50; m = 4;

[x, y] = odj_pred_kor(f, a, b, y0, n, m);
plot(x, y)