function [ phi ] = AdamsBashforth4( f )
%ADAMS-BASHFORTH Summary of this function goes here
%   Detailed explanation goes here

phi = 1/720 * (1901*f(5) - 2774*f(4) + 2616*f(3) - 1274*f(2) + 251*f(1));

end

