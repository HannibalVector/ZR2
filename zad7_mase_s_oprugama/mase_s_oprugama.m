m1 = 2; m2 = 5; m3 = 3; m4 = 6;
k1 = 10; k2 = 9; k3 = 8; k4 = 7; k5 = 6; k6 = 5; k7 = 5; k8 = 5;

M = diag([m1 m2 m3 m4]);
K = [   k1+k2+k6    -k2         -k6             0; 
        -k2         k2+k3+k8    -k3             -k8;  
        -k6         -k3         k3+k4+k6+k7     -k4;
        0           -k8         -k4             k4+k5+k8];
    
    M12 = M^(-0.5);
    A = M12*K*M12 - 4*eye(4);
    
    residual = [];
    tol = 1.0e-8;
    condition = @(x) norm(A*x - x'*A*x*x);
    x = ones(4, 1);
    k = 0;
    y = x/norm(x);
    cond = condition(y);
    
    p = plot(y, 'b-o');
    xlabel('Indeks komponente');
    ylabel('Komponenta');
    
    axis([0.5 4.5 -1 1]);
    grid on;

    
    while cond > tol
        [x, ~, relres] = minres(A, y, tol, 4);
        k = k + 1;
        y = x/norm(x);
        cond = condition(y);
        residual = [ residual;  cond];
        
        %plotting
        title(sprintf('Aproksimacija svojstvenog vektora: iteracija %d', k));
        pause(0.5);
        set(p, 'Ydata', y);
        refreshdata
        drawnow
    end
    
    figure
    semilogy(residual);
    xlabel('Iteracija');
    ylabel('Norma reziduala');
    eigenvector = y
    rho = 4 + y'*A*y
    
    