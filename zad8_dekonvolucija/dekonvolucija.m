load('model_dekonvolucija_uy.mat');
load('model_dekonvolucija_hh.mat');

C = [];
n = 18; m = 102;
for i=0:m
    C = [C; up((i+n+1):-1:(i+1))];
end
C = [C yp];
[U, S, V] = svd(C);


V12 = V(1:19, 20);
V22 = V(20, 20);

x = - V12/V22;

plot(x, 'r-')
hold on
plot(hh)