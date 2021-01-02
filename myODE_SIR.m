function dx = myODE_SIR(t,x)
    alfa = 0.009;
    beta = 0.001;
    dx(1,1) = -alfa*x(1) + beta*x(2);
    dx(2,1) = alfa*x(1) - beta*x(2);
end