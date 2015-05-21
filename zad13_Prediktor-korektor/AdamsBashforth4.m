function [ phi ] = AdamsBashforth4( f )
%ADAMS-BASHFORTH Summary of this function goes here
%   Detailed explanation goes here

phi = 1/24 * (55*f(4) - 59*f(3) + 37*f(2) - 9*f(1));

end

