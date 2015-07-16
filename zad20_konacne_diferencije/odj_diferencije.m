q = @(x) 400*ones(size(x));
g = @(x) -400*cos(pi*x).^2 - 2*pi*pi*cos(2*pi*x);

a = 0; b = 1;
alpha = 0; beta = 0;
n = 100;

[A, c, x] = odj_diferencije_Ac(q, g, a, b, alpha, beta, n);

u = A\c;

x = [a; x; b];
u = [alpha; u; beta];

plot(x, u, 'bo')

ee = 1 + exp(-20);
u_egz = @(x) exp(-20)/ee * exp(20*x) + exp(-20*x)/ee - cos(pi*x).^2;

hold on
fplot(u_egz, [a, b], 'r-')

greska = max(abs(u - u_egz(x)))
xlabel('x')
ylabel('u(x)')
legend('metoda diferencija', 'egzaktno')