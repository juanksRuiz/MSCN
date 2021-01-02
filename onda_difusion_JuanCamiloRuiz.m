clc, clear;
format long
a = 3;
b = 8;
Du = 1;
Dvs =[2.3,3,5,9] ; % Dv >1
Dv = Dvs(4);
L = 128;

x = linspace(0,1,L) ;
y = linspace(0,1,L) ;
dt = 0.01;
t = 0:dt:10;
% inicializamos las matrices U y V en los equilibrios + una pequeña
% perturbacion
U = a*ones(length(x)) + normrnd(0,0.3,[length(x),length(x)]);
Uold = U;
V = (b/a)*ones(length(x)) + normrnd(0,0.3,[length(x),length(x)]);
Vold = V;

%% Animacion de resultados
for j =1:length(t)
% Aplicamos el metodo de Euler
U = Uold + dt*derivativeU(Uold,Vold,a,b,Du);
V = Vold + dt*derivativeV(Uold,Vold,b,Dv);
Uold = U;
Vold = V;

%Graficas
figure(1)                   % plot equilibriums
subplot(1,2,1)
pcolor(x,y,U) ;
caxis([1, 10]);
colorbar
colormap(jet)
shading interp
title('u')

subplot(1,2,2)
pcolor(x,y,V) ;
caxis([0, 8]);
colorbar
colormap(jet)
shading interp
title('v')
%sgtitle('Equilibrium')
drawnow    
end

%% definimos las funciones de las derivadas
function res = derivativeU(u,v,a,b,Du)
   n = size(u,1);
   Lap = diag(-2*ones(n,1)) + diag(ones(n-1,1),1) + diag(ones(n-1,1),-1);
   Lap(end,1) = 1;
   Lap(1,end) = 1;
   res = a*ones(size(u)) - (b+1)*u + (u.^2).*v + Du*(u*Lap + Lap*u);
end

function res = derivativeV(u,v,b,Dv)
    n = size(v,1);
    Lap = diag(-2*ones(n,1)) + diag(ones(n-1,1),1) + diag(ones(n-1,1),-1);
    Lap(end,1) = 1;
    Lap(1,end) = 1;
    res = b*u - (u.^2).*v + Dv*(v*Lap + Lap*v);
end