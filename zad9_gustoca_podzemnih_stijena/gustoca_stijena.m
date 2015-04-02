m = 15; n = 15; d = 0.25;

s0 = 0; s1 = 1;
t0 = 0; t1 = 1;

ds = (s1 - s0)/(m-1);
dt = (t1 - t0)/(n-1);

k = @(s, t) d / (d^2 + (s - t)^2)^1.5;
t = (t0:dt:t1)';
s = t;
K = zeros(m, n);
for ii=1:m
    for jj=1:n
        K(ii, jj) = k(s(ii), t(jj));
    end
end
K = 1/(n-1)*K;
K(:, 1) =  K(:, 1) / 2;
K(:, n) =  K(:, n) / 2;

load('model_gravitacija_g.mat');

ksi = 0.1*randn(15,1);
b = g - ksi;

[U S V] = svd(K);

plot(diag(S), 'r-o')
title('Singularne vrijednosti matrice K');

f = @(p) V(:, 1:p) * (S(1:p, 1:p)\U(:, 1:p)') * b;
f_egz = @(t) sin(pi*t) + 0.5*sin(2*pi*t);
Kinv = @(p) V(:, 1:p) * (S(1:p, 1:p)\U(:, 1:p)');

f_egz_vec = f_egz(t);

figure
plot(f_egz_vec, 'b-o');
hold on;
p = plot(f(1), 'r-o');
axis([0.5 15.5 0 2]);
xlabel('Cvor');
legend('Egzaktno rjesenje', 'Aproksimativno rjesenje');

grid on;
for k = 2:min(m, n)
    %plotting
    title(sprintf('Aproksimacija rjesenja za matricu ranga %d', k));
    pause(0.5);
    set(p, 'Ydata', f(k));
    refreshdata
    drawnow
end
    

