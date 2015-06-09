p1_0 = 5000;
p2_0 = 100;
p_0 = [p1_0; p2_0];

t1 = 0; t2 = 30;
tol = 1.0e-2;
n = 300;



[T1, P1] = odj_rk4v(@grab_plijen_funkcija, p_0, t1, t2, n);
[T2, P2] = odj_rk23v(@grab_plijen_funkcija, p_0, t1, t2, tol);

subplot(2, 1, 1)
plot(T1, P1(1, :), T2, P2(1, :), 'ro')
xlabel('vremenska jedinica')
ylabel('populacija')
title('populacija plijena')
legend('rk4', 'rk23')

subplot(2, 1, 2)
plot(T1, P1(2, :), T2, P2(2, :), 'mo')
xlabel('vremenska jedinica')
ylabel('populacija')
title('populacija grabezljivca')
legend('rk4', 'rk23')

