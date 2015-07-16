a = 0; b = 1;
alpha = 4; beta = 1;
n= 200;

s0 = -45;

[x, y, s] = odj_gadjanje_2rru(@f_2rru, a, b, alpha, beta, s0, n);
plot(x, y, 'r-');
s

s0 = -3;
[x, y, s] = odj_gadjanje_2rru(@f_2rru, a, b, alpha, beta, s0, n);
hold on
plot(x, y, 'b-');
s

legend('y_1(x)', 'y_2(x)')
xlabel('x')
ylabel('y(x)')

