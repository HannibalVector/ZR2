f = @(x, y) -y + -5*exp(-x)*sin(5*x);
y0 = 1; 
x0 = 0; x1 = 3;
n = 30;
y_exact = @(x) exp(-x).*cos(5*x);

% Euler *************************************************************
[ x_nodes,  y_approx ] = odj_euler(f, y0, x0, x1, n);

plot(x_nodes, y_approx, '*-');
xlabel('x');
ylabel('y');
title('Eulerova metoda');

hold on;
fplot(y_exact, [0 3], 'r-');
legend('aproksimativno rjesenje', 'egzaktno rjesenje')

sprintf('Eulerova metoda\nMaksimalna greska %e', max(abs(y_approx - y_exact(x_nodes))))

% RK-4 **************************************************************
[ x_nodes,  y_approx ] = odj_rk4(f, y0, x0, x1, n);

figure
plot(x_nodes, y_approx, '*-');
xlabel('x');
ylabel('y');
title('RK-4 metoda');

hold on;
fplot(y_exact, [0 3], 'r-');
legend('aproksimativno rjesenje', 'egzaktno rjesenje')

sprintf('RK-4 metoda\nMaksimalna greska %e', max(abs(y_approx - y_exact(x_nodes))))