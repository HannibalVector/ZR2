function [ ] = kredit_raz( n )
%KREDIT_RAZ Summary of this function goes here
%   Detailed explanation goes here

load('model_kredit_A.mat');
u = zeros(8, 1);
u(1) = 1;

p = plot(u, 'b-o');
set(gca,'XTick', 1:8);
set(gca,'XTickLabel', { 'AAA', 'AA', 'A', 'BBB', 'BB', 'B', 'CCC', 'D' } );
xlabel('stanje');
ylabel('gustoca');
axis([0.5 8.5 0 1]);
grid on;

for i=1:(n+1)
    title(sprintf('iteracija br. %d', i));
    u = A*u;
    pause(0.1);
    set(p, 'Ydata', u);
    refreshdata
    drawnow
end

end

