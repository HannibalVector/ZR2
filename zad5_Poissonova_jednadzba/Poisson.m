P = gallery('poisson', 19);
h = 0.05;
b = zeros(361, 1);
b(181) = h^2*10000;
tol = 1.0e-8;

cond_P = condest(P);
[ x_cg, flag_cg, relres_cg, iter_cg, resvec_cg] = pcg(P, b, tol, 40);
resvec_cg = resvec_cg/norm(b);

R = cholinc(P, '0');
cond_P_preconditioned = condest((R'*R)\P);
[ x_pcg, flag_pcg, relres_pcg, iter_pcg, resvec_pcg] = pcg(P, b, tol, [], R', R);
resvec_pcg = resvec_pcg/norm(b);

fprintf('uvjetovanost matrice sustava:');
cond_P
fprintf('broj iteracija za CG:');
iter_cg
fprintf('uvjetovanost prekondicionirane matrice sustava:');
cond_P_preconditioned
fprintf('broj iteracija za PCG:');
iter_pcg


semilogy(resvec_cg, 'r--');
xlabel('broj iteracija');
ylabel('relativni rezidual');
hold on;
semilogy(resvec_pcg, 'b');
hold off;

figure;
X = vec2mat(x_pcg, 19);
surf(X);