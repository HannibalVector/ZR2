f = @(x, y) example_function(x, y);
y0 = 0; 
x0 = 0; x1 = 4;
tol = 1e-5;
y_exact = @(x)  example_solution(x);

[ x_unif,  y_unif, x_var, y_var ] = odj_rk23(f, y0, x0, x1, tol);

plot(x_var, y_var, '*-r');
hold on;
plot(x_unif,  y_unif, 'o-');
xlabel('x');
ylabel('y');
title('Runge-Kutta-Fehlbergova metoda');

fplot(y_exact, [0 4], 'k-');
legend('aproksimativno rjesenje RK-23', 'aproksimativno rjesenje RK-2','egzaktno rjesenje')

n = size(x_var, 1);
y_exact_vec = zeros(n, 1);
for i = 1:n
    y_exact_vec(i) = y_exact(x_var(i));
end
sprintf('Maksimalna greska %e', max(abs(y_var - y_exact_vec)))