lags = 8;
tf=200;
t=linspace(0,tf,100);

sol = dde23(@ddefunc,lags,@yhist,t)
y=deval(sol,t)
figure,
plot(t,y)

plot(sol.x,sol.y)

function dy = ddefunc(t,y,YL)
r = 0.15;k=1;
dy = r*y.*(1-YL/k);
end

function y =yhist(t)
    y0=0.5;
    y=y0;
end