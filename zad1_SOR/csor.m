function [ c ] = csor( A, b, omega )
%TSOR Funkcija vraca matricu iteracija Tsor i vektor csor potrebne za SOR metodu.
    D = diag(diag(A));
    L = tril(A,-1);
    
    c = omega*((D + omega*L)\b);

end
