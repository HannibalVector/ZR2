function [ x_unif, y_unif, x_var, y_var ] = odj_rk23( f, y0, a, b, tol )
%ODJ_RK4 Summary of this function goes here

    alpha = 0.9;

    k1 = @(x, y) f(x, y);
    k2 = @(x, y, h) f(x + h/4, y + h/4*k1(x, y));
    k3 = @(x, y, h) f(x + 27/40*h, y + h*(-189/800*k1(x, y) + 729/800*k2(x, y, h)));
    k4 = @(x, y, h) f(x + h, y + h*(214/891*k1(x, y) + 1/33*k2(x, y, h) + 650/891*k3(x, y, h)));
    
    phi2 = @(x, y, h) 214/891*k1(x, y) + 1/33*k2(x, y, h) + 650/891*k3(x, y, h);
    phi3 = @(x, y, h) 533/2106*k1(x, y) + 800/1053*k3(x, y, h) -1/78*k4(x, y, h);
    
    h_novi = @(h, y3, y2) alpha*h*((tol / abs(y3 - y2))^(1/3)); 
    
    y3 = y0;
    y2 = y0;
    x = a;
    i = 1;
    
    while(x(i) < b)
        h = b - a;
        y2 = [y2; y2(i) + h*phi2(x(i), y2(i), h)];
        y3 = y2(i) + h*phi3(x(i), y2(i), h);
        while (abs(y3 - y2(i+1)) > tol)
            h = h_novi(h, y3, y2(i+1));
            if (x(i) + h > b)
                h = b - x(i);
            end
            y2(i+1) = y2(i) + h*phi2(x(i), y2(i), h);
            y3 = y2(i) + h*phi3(x(i), y2(i), h);
        end
        x = [x; x(i) + h];
        i = i+1;
    end
    
    y_var = y2;
    x_var = x;
    
    n = size(y_var, 1);
    y_unif = zeros(n, 1);
    h = (b - a)/n;
    x_unif = (a:h:b)';
    y_unif(1) = y0;
    
    for i = 1:n
        y_unif(i+1) = y_unif(i) + h*phi2(x_unif(i), y_unif(i), h);
    end
end