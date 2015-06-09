function [ f ] = term_obrada_funkcija( t, T )
%TERM_OBRADA_FUNKCIJA Ukupna snaga prijenosa toplinske energije prilikom
%termicke obrade sipke.

l = 1; PHI = 0.01; rho = 7822; c = 444; 
epsilon = 0.7; H1 = 15; H2 = 100;
To = 294.15; th = 70; Qe_max = 3000;
sigma = 5.67e-8;

m = rho * (0.5*PHI)^2 * pi * l;
Ap = PHI * pi * l;

if t < th
    Qe = Qe_max;
    H = H1;
else
    Qe = 0;
    H = H2;
end

f = 1/(m*c) * (Qe - Ap * (H * (T - To) + epsilon * sigma * (T^4 - To^4)));

end

