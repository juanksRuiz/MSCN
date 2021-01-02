npob = 101;
S0 = 100;
I0 = 1;


t0 = 0;
tf = 500;

[t,x] = ode45('myODE_SIR',[t0 tf],[100,1]);
plot(t,x);
legend('S','I')


