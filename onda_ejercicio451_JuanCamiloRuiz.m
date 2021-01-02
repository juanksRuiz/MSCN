% En este programa se calcula una aproximación numérica a la ecuacion de
% onda con el método de diferencias finitas.
% Fuente: https://www2.uned.es/ribim/volumenes/Vol15N2Octubre2011/V15N2A03%202011%20Millan%2029-38.pdf

L = 10;
dx = 0.5; % paso de x
x = 0:dx:L;
dt = 0.1; % paso de t
t = 0:dt:60;
c = 1;
u0 = 5; % condicion inicial
U = zeros(length(t),length(x));
U(1,:) = u0*ones(1,length(x));
U(2:end,1) = zeros(length(t)-1,1);
U(2:end,end) = zeros(length(t)-1,1);

lam = (c*dt)/(dx^2);

%% Grafica de la solucion
for j = 1:(length(t)-1)
    for i = 2:(length(x)-1)
        U(j+1,i) = lam*U(j,i-1) + (1-2*lam)*U(j,i) + lam*U(j,i+1);
    end
end
surf(x,t,U,'edgecolor','none')
xlabel("x")
ylabel("t")
zlabel("u")

%% Animación de evolución de la temperatura
for j = 1:length(t)
    plot(x,U(j,:));
    axis([0 L 0 u0])
    xlabel("x");
    ylabel("u");
    title("Evolución del calor en el tiempo")
    pause(0.01);
    cla;
end