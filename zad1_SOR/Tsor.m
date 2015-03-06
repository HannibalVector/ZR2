function [ T ] = Tsor( A, omega )
%TSOR Funkcija vraca matricu iteracija Tsor i vektor csor potrebne za SOR metodu.
    D = diag(diag(A));
    L = tril(A,-1);
    U = triu(A, 1);
    
    T = (D + omega*L)\((1 - omega)*D - omega*U);
end