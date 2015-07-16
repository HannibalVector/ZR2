T = @(x) [x, 0, -x^2; 2*x^3-x, 3*x^2-2*x+1, -4*x-2; -3*x^3+2, 2*x^3+x^2-3*x, 2*x];
g = @(x) [-2*x^2 + 5*x - 3; x+3; -x^3+1];

a = 0; b = 2;
A = [1 0 -1; 2 3 1; 4 5 -2];
B = eye(3);
c = [3; -8; 5];

n = 200;

[x, y, s] = odj_gadjanje_linrp(T, g, A, B, c, a, b, n);

plot(x, y(1, :)', 'b-')
hold on
plot(x, y(2, :)', 'r-')
plot(x, y(3, :)', 'g-')
xlabel('x')
ylabel('y(x)')
legend('y_1(x)', 'y_2(x)', 'y_3(x)', 'Location', 'SouthWest')



