s = 11;

y0 = rand(s, 1);
y0(s)=10*y0(s);

y0


rho = @(y, x) spline(linspace(0, y(s), s-1), y(1:s-1), x);

cost = @(y) integral(@(x) 5*rho(y, x) + 3, 0, y(s));

lb = zeros(s, 1);
ub = ones(s, 1);
ub(s) = Inf;
y_opt = fmincon(cost, y0, [],[],[],[], lb, ub, @nonlcon);

L = y_opt(s);
X = linspace(0, L, 200);
Y = spline(linspace(0, L, s-1), y_opt(1:s-1), X);
C = cost(y_opt);
[UL, U] = uL(L, y_opt(1:s-1), 200);

L
C
UL