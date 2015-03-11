load('model_portfelj_Cm.mat')
ocekivani_povrat = 0.05;

N = size(m, 1);
e = ones(N, 1);
x0 = zeros(N, 1);

% sor
sor_konvergencija(C);
[x1, k1_sor, res1_sor] = sor(C, m, x0, 1.0e-8, 1.2);
[x2, k2_sor, res2_sor] = sor(C, e, x0, 1.0e-8, 1.2);
[ omega_min_sor, omega_povrat_sor ] = omega(x1, x2, m, ocekivani_povrat);
fprintf('SOR metoda:\n');
fprintf('portfelj s najmanjom varijancom');
omega_min_sor
fprintf('portfelj s najmanjom varijancom i ocekivanim povratom');
omega_povrat_sor

%pcg
[x1, ~, ~, k1_pcg, res1_pcg] = pcg(C, m, 1.0e-8, N, [], [], x0);
[x2, ~, ~, k2_pcg, res2_pcg] = pcg(C, e, 1.0e-8, N, [], [], x0);
[ omega_min_pcg, omega_povrat_pcg ] = omega(x1, x2, m, ocekivani_povrat);
fprintf('PCG metoda:\n');
fprintf('portfelj s najmanjom varijancom');
omega_min_pcg
fprintf('portfelj s najmanjom varijancom i ocekivanim povratom');
omega_povrat_pcg

%plot
figure;
semilogy(res1_sor, 'r--'); hold on;
semilogy(res1_pcg, 'b-o');
xlabel('iteracija');
ylabel('rel. norma reziduala');
title('Relativna norma reziduala - porftelj s najmanjom varijancom');
legend('SOR', 'PCG');

figure;
semilogy(res2_sor, 'r--'); hold on;
semilogy(res2_pcg, 'b-o');
xlabel('iteracija');
ylabel('rel. norma reziduala');
title('Relativna norma reziduala - porftelj s najmanjom varijancom i ocekivanim povratom');
legend('SOR', 'PCG');
hold off;