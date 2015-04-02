% primjer a
f_a = @(x, y) -x.*y + x*exp(0.5*x.^2);
y_a_exact = @(x) cosh(0.5*x.^2);
n = (10:2:100)';
Euler_test(@Euler, f_a, 1, 0, 1, n, y_a_exact, 'primjer A (Euler)');
Euler_test(@Euler2, f_a, 1, 0, 1, n, y_a_exact, 'primjer A (Euler2)');

% primjer b
f_b = @(x, y) 2*x.*y + x;
y_b_exact = @(x) 1.5*exp(x.^2)-0.5;
Euler_test(@Euler, f_b, 1, 0, 1, n, y_b_exact, 'primjer B (Euler)');
Euler_test(@Euler2, f_b, 1, 0, 1, n, y_b_exact, 'primjer B (Euler2)');

% primjer c
f_c = @(x, y) 1 + y.^2;
y_c_exact = @(x) tan(x+pi/4);
Euler_test(@Euler, f_c, 1, 0, 0.5, n, y_c_exact, 'primjer C (Euler)');
Euler_test(@Euler2, f_c, 1, 0, 0.5, n, y_c_exact, 'primjer C (Euler2)');