function [ epsilon, h ] = Euler_test( Euler, f, y0, a, b, n, y_exact, label )
%EULER_TEST racuna inf normu odstupanja i h

    epsilon = zeros(size(n));
    h = zeros(size(n));
    for i = 1:size(n, 1)
        [ y_approx, h(i) ] = Euler(f, y0, a, b, n(i));
        epsilon(i) = norm(y_approx - y_exact((a:h(i):b)'), inf);
    end
    
    figure;
    plot(h, epsilon);
    xlabel('h');
    ylabel('inf norma odstupanja');
    title([ label ' - odstupanje u ovisnosti o h' ]);
    
end

