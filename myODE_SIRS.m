function dx = myODE_SIRS(t,x)
    alfa = 0.05;
    beta = 0.1;
    gamma = 0.0001;
    % S
    dx(1,1) = -alfa*x(1)*x(2) + gamma*x(3);
    % I
    dx(2,1) = alfa*x(1)*x(2) - beta*x(2);
    % R
    dx(3,1) = beta*x(2) - gamma*x(3);
end