function [ rho ] = sor_konvergencija( A )
%SOR_KONVERGENCIJA Summary of this function goes here
%   Detailed explanation goes here
    omega = (0:0.1:2)';
    rho = zeros(21, 1);
    for i=1:21
        rho(i) = max(abs(eig(Tsor(A, omega(i)))));
    end
    plot(omega, rho);
    xlabel('omega');
    ylabel('rho(Tsor)');
    title('Spektralni radijus matrice iteracija u ovisnosti o omega');
end

