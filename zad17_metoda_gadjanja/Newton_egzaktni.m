function [ s ] = Newton_egzaktni( FdF, s0 )
%NEWTON Summary of this function goes here
%   Detailed explanation goes here

eps = 1.0e-8;
s = s0;
n = 0;

F = FdF(s);

while (abs(F) > eps)
[F, dF] = FdF(s);
s = s - F/dF;
n = n + 1;
end

sprintf('Newton egzaktni iskonvergirao u n = %d koraka', n)

end

