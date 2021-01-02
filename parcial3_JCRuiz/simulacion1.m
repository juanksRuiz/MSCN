clc, clear
D1 = 0.05; D2 = 0.05; k = 0.005; c = 0.001; G0 = 1000;
L = 128;

x = linspace(0,1,L);
y = linspace(0,1,L);
dt = 0.1;
t = 0:dt:30;
g_eq = 1300; % representa el valor g en el equilibrio
y_eq = 200; % representa el valor y en el equilibrio

% condiciones de estabilidad
cond1 = g_eq < k+G0

%inicializamos las matrices Y y G en los equilibrios + una preturbacion
%% Simulacion para el equilibrio 1: (0,g)
Y1 = zeros(length(x)) + normrnd(0,0.3,[length(x),length(x)]);
Y1old = Y1;
G1 = g_eq*ones(length(x)) + normrnd(0,0.3,[length(x),length(x)]);
G1old = G1;
for j = 1:length(t)
% Se aplica el método de Euler
Y1 = Y1old + dt*dY(Y1old,G1old,k,G0,D1);
G1 = G1old + dt*dG(Y1old,G1old,c,k,G0,D2);
Y1old=Y1;
G1old=G1;
% Graficas
figure(1)           %plot equilibriums
subplot(1,2,1)
pcolor(x,y,Y1);
caxis([1,10]);
colorbar
colormap(jet)
shading interp
title("Y")

subplot(1,2,2)
pcolor(x,y,G1);
caxis([0,8]);
colorbar
colormap(jet)
shading interp
title("G")
drawnow
end

%% Simulacion para el equilibrio 2: (y,G0)
Y2 = y_eq*ones(length(x)) + normrnd(0,0.3,[length(x),length(x)]);
Y2old = Y2;
G2 = G0*ones(length(x)) + normrnd(0,0.3,[length(x),length(x)]);
G2old = G2;
for j = 1:length(t)
% Se aplica el método de Euler
Y2 = Y2old + dt*dY(Y2old,G2old,k,G0,D1);
G2 = G2old + dt*dG(Y2old,G2old,c,k,G0,D2);
Y2old=Y2;
G2old=G2;
% Graficas
figure(1)           %plot equilibriums
subplot(1,2,1)
pcolor(x,y,Y2);
caxis([1,10]);
colorbar
colormap(jet)
shading interp
title("Y")

subplot(1,2,2)
pcolor(x,y,G2);
caxis([0,8]);
colorbar
colormap(jet)
shading interp
title("G")
drawnow
end


%% Derivadas
function res = dY(y,g,k,g0,D1)
n = size(y,1);
Lap = diag(-2*ones(n,1)) + diag(ones(n-1,1),1) + diag(ones(n-1,1),-1);
Lap(end,1) = 1;
Lap(1,end) = 1;
res = D1*Lap + k*y.*(g-g0*ones(size(y)));
end

function res = dG(y,g,c,k,g0,D2)
n = size(g,1);
Lap = diag(-2*ones(n,1)) + diag(ones(n-1,1),1) + diag(ones(n-1,1),-1);
Lap(end,1) = 1;
Lap(1,end) = 1;
res = D2*Lap - c*k*y.*(g-g0*ones(size(y))); %
end