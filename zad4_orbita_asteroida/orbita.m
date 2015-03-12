load('model_orbita_polozaji.mat');
f1 = @(p) [ p(:, 1).*p(:, 2) p(:, 2).^2 p(:, 1) p(:, 2) ones(size(p,1),1)];
p = [p1'; p2'; p3'; p4'; p5'];
A = f1(p);
b = -p(:, 1).^2;
a = A\b;

f = @(x, y) x.^2 + a(1)*x.*y + a(2)*y.^2 +a(3)*x + a(4)*y + a(5);

x = -5:0.1:5;
y = x;
[X, Y] = meshgrid(x, y);
Z = f(X, Y);
contour(x, y, Z, [0 0], 'b');
grid on
figure;
surf(X, Y, Z);