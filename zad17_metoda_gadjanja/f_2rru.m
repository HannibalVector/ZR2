function [ dy ] = f_2rru( x, y )
%F_2RRU Summary of this function goes here
%   Detailed explanation goes here

dy = [y(2); 1.5*y(1)^2];

end

