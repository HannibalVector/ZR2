function [ value ] = example_solution( x )
%F Summary of this function goes here
%   Detailed explanation goes here
    if (x <= pi)
        value = 1 - exp(-x);
    else
        value = (1-exp(-pi))*exp(-5*(x-pi));
    end
end

