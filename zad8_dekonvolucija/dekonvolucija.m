load('model_dekonvolucija_uy.mat');
load('model_dekonvolucija_hh.mat');

C1 = [];
n = 18; m = 102;
for i=0:m
    C1 = [C1; up((i+n+1):-1:(i+1))];
end
C = [C1 yp];
[U, S, V] = svd(C);


V12 = V(1:19, 20);
V22 = V(20, 20);

x = - V12/V22;

plot(x, 'r-')
hold on
plot(hh)

min(diag(S))
[~, S1, ~] = svd(C1);
min(diag(S1))