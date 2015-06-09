addpath ../zad11_Runge-Kutta-Fehlberg/
addpath ../zad10_Euler_RK-4/

t1 = 0; t2 = 210;
To = 294.15;

[T1, Y1] = odj_rk23(@term_obrada_funkcija, To, t1, t2, 1.0e-3);

plot(T1', Y1', 'ro-');
hold on

N = size(T1, 2) - 1;

[T2, Y2] = odj_rk4(@term_obrada_funkcija, To, t1, t2, N);

plot(T2, Y2, 'b-');

[T3, Y3] = odj_rk4(@term_obrada_funkcija, To, t1, t2, 2*N);

plot(T3, Y3, 'k-');
title('Termička obrada metalne šipke');
xlabel('t[s]');
ylabel('T[K]');
legend('RK23', 'RK4', 'RK4 dvostruki br. koraka')