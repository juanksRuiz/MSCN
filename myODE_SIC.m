function dx = myODE_SIC(t,x)
alfa = 0.05;
beta = 0.5;
gamma = 0.1;
dx(1,1) = -alfa*x(1)*x(3) + beta*x(2);
dx(2,1) = alfa*x(1)*x(3)-beta*x(2);
dx(3,1) = -gamma*x(3);
end