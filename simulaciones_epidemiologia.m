% Modelo SIRS
t0 = 0;
tf = 10;

[t,x] = ode45('myODE_SIRS',[t0 tf],[100;1;0]);
plot(t,x);
legend("S","I","R");

%% Modelo SIC (suceptible, infectado, portador)
% depende de gamma
[t,x] = ode45('myODE_SIC',[t0 tf],[100,1,15]);
plot(t,x)
legend("S","I","C")


