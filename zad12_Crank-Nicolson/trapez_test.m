f = @(x, y) -100*(y - cos(x)) - sin(x);
y0 = 1;
a = 0; b = 1;

y_egz = @(x) cos(x);


err_t = zeros(31, 1);
err_rk = zeros(31, 1);

for n = 20:50
    [x_t, y_t] = odj_impl_trapez(f, a, b, y0, n);
    [x_rk, y_rk] = odj_rk2(f, y0, a, b, n);
    
    axis([0 1 0 1]);
    fplot(y_egz, [a b], 'k-');
    hold on

    plot(x_t, y_t, 'or');
    plot(x_rk, y_rk, '*b');

    y_egz_vec = y_egz(x_t);
    err_t(n) =  max(abs(y_egz_vec - y_t));
    err_rk(n) = max(abs(y_egz_vec - y_rk));
    hold off
    title(sprintf('n = %d', n));
    legend('egzaktno rjesenje', 'Crank-Nicolson', 'RK2');
    pause(0.01)
end

figure
plot(err_t, 'r-')
hold on
plot(err_rk, 'b')
title('Odstupanje od egzaktnog rjesenja')
legend('Crank-Nicolson', 'RK2')

err_t(31)
err_rk(31)