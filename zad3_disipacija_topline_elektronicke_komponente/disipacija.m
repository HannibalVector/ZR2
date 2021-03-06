R1 = 2; R2 = 0.5; R3 = 35; R4 = 0.7; R5 = 1;
Ta = 20; Qc = 10;
A = [R1 0 0 0 -1 1 0; 0 R2 0 0 0 -1 1; 0 0 R3 0 -1 0 0; 0 0 0 R4 0 -1 0; 0 R5 0 0 0 0 -1; 1 0 1 0 0 0 0; 1 -1 0 -1 0 0 0];
b = [0 0 -Ta -Ta -Ta Qc 0]';

S = sparse(A);
f = @(x) mdAx(S, x);

[ x, flag, relres, ~, reziduali ] = gmres(f, b, [], 1.0e-8, [], [], [], ones(size(b)));

xlabel('broj iteracija');
ylabel('relatina norma reziduala');
x
reziduali = reziduali/norm(b);
reziduali = [reziduali; relres];

semilogy(reziduali, 'r-o');