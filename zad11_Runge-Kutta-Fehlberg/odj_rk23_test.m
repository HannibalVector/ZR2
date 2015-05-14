f = @(x, y) example_function(x, y);
y0 = 0; 
x0 = 0; x1 = 4;
tol = 1e-5;
y_exact = @(x)  example_solution(x);

[ X23,  Y23 ] = odj_rk23(f, y0, x0, x1, tol);

n = size(X23, 2);

[ X2, Y2 ] = odj_rk2(f, y0, x0, x1, n);

plot(X23, Y23, '*-r');
hold on;
plot(X2,  Y2, '-');
xlabel('x');
ylabel('y');
title('Runge-Kutta-Fehlbergova metoda');

fplot(y_exact, [0 4], 'k-');
legend('aproksimativno rjesenje RK-23', 'aproksimativno rjesenje RK-2','egzaktno rjesenje', 'Location', 'NorthWest')

y_exact_vec = zeros(size(Y23));
for i = 1:n
    y_exact_vec(i) = y_exact(X23(i));
end
sprintf('Maksimalna greska RK23 %e', max(abs(Y23 - y_exact_vec)))

y_exact_vec2 = zeros(size(Y2));
for i = 1:n
    y_exact_vec2(i) = y_exact(X2(i));
end
sprintf('Maksimalna greska RK2 %e', max(abs(y_exact_vec2 - Y2)))