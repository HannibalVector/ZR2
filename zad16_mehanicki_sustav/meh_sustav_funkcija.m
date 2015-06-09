function [ dy ] = meh_sustav_funkcija( t, y )
%MEH_SUSTAV_FUNKCIJA Summary of this function goes here
%   Detailed explanation goes here

omjer_masa = 1;
g = 9.8;
zeta = 0.1;
omega_n = 35;

dy1 = y(2);
dy2 = omjer_masa * g - 2 * zeta * omega_n * y(2) - omega_n^2 * y(1);

dy = [dy1; dy2];

end

