function [ phi ] = AdamsMoulton3( f )
%ADAMS_MOULTON Summary of this function goes here
%   Detailed explanation goes here

phi = 1/24 * (9*f(4) + 19*f(3) - 5*f(2) + f(1));

end

