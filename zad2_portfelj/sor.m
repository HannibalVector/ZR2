function [ x, i, odstupanje ] = sor( A, b, x0, tol, omega )
%SOR Funkcija implementira SOR metodu za rjesavanje linearnih sustava
    x = x0;
    T = Tsor(A, omega);
    c = csor(A, b, omega);
    i = 1;
    odstupanje = norm(b - A*x) / norm(b);
    while (odstupanje(i) > tol) && (i<30)
        x = T*x + c;
        i = i + 1;
        odstupanje = [odstupanje; norm(b - A*x) / norm(b)];
    end


end

