function [ dg ] = differentiate( g )
%DIFF Summary of this function goes here
%   Detailed explanation goes here
w = sym('w');
gs = g(w);
dgs = diff(gs);
dg = @(z) double(subs(dgs, z));

end

