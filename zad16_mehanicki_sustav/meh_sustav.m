addpath ../zad15_grabezljivac_plijen/

y_0 = [0; 0];

t1 = 0; t2 = 1.5;
tol = 1.0e-5;

[T, Y] = odj_rk23v(@meh_sustav_funkcija, y_0, t1, t2, tol);

subplot(2, 1, 1)
plot(T, Y(1, :), 'ro-')
xlabel('$t$','Interpreter','LaTex', 'FontSize', 15)
ylabel('$x(t)$','Interpreter','LaTex', 'FontSize', 15)
title('polozaj u ovisnosti o vremenu')

subplot(2, 1, 2)
plot(T, Y(2, :), 'bo-')
xlabel('$t$','Interpreter','LaTex', 'FontSize', 15)
ylabel('$\dot{x}(t)$','Interpreter','LaTex', 'FontSize', 15)
title('brzina u ovisnosti o vremenu')