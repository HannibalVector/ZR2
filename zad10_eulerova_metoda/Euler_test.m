f = @(x, y) -y + -5*exp(-x)*sin(5*x);
y0 = 1; 
x0 = 0; x1 = 3;
n = 30;
y_exact = @(x) exp(-x).*cos(5*x);

[ x_nodes,  y_approx ] = Euler(f, y0, x0, x1, n);

plot(x_nodes, y_approx, '*-');
xlabel('x');
ylabel('y');

hold on;
fplot(y_exact, [0 3], 'r-');
legend('aproksimativno rjesenje', 'egzaktno rjesenje')

sprintf('Maksimalna greska %f', max(y_approx - y_exact(x_nodes)))
