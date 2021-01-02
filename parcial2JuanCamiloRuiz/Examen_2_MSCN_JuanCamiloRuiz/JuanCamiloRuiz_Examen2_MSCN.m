clc, clear, close all
% DESCOMENTAR FUNCION simulacion en cada seccion para ver resultado
t0 = 0;
tf = 40;
h = 0.1;
tspan = t0:h:tf;

% Ejercicio 1
r = 0.5; k = 50;B = 0.002; a = 0.005;s = 0.5; g = 0.4;
x0 = 170;
y0 = 40;
f1 = @(x,y) r*x*(1-x/k) - (B*x*y)/(x+a);
f2 = @(x,y) s*y*(1-y/(g*x));
[x,y] = euler(tspan,x0,y0,f1,f2);

A = r-(a*r)/k - B*g;
%equilibrios
eq_2 = [k,0];

x_eq3 = (2*k/r)*(A+sqrt(A^2+4*a*(r^2)/k));
y_eq3 = g*x_eq3;
eq_3 = [x_eq3, y_eq3];

eq_4 = [x_eq3,0];
% condiciones para eq_4
sigma = r-B*g + sqrt((B*g-r+a*r/k)^2 + 4*a*(r^2)/k) - a*r/k;
cond1 = sigma > 1/4;
equilibrios = [eq_2;eq_3;eq_4];


simulacion(x,y,equilibrios);
xlabel("x");
ylabel("y");

%% Ejercicio 2
g1 = @(x,y) y;
g2 = @(x,y) -5*sin(x)-(9/13)*y;

x0 = 1;
y0 = 5;

[x2,y2] = euler(tspan,x0,y0,g1,g2);

a = pi*(-5:5);
equilibrios2 = [a',zeros(length(a),1)];
%simulacion(x2,y2,equilibrios2)
xlabel("x");
ylabel("y");

%% Ejercicio 3
V = 2; K = 5000;k = 5000; c = 10;
h1 = @(x,y) x*V*y/(K+y);
h2 = @(x,y) -(x/c)*(V*y/(k+y));
a = 0:2000;
equilibrios_3_1 = [a',zeros(length(a),1)];
equilibrios_3_2 = [zeros(length(a),1),a'];
equilibrios3 = [equilibrios_3_1;equilibrios_3_2];

x0 = 1000;
y0 = 1000;

[x3,y3] = euler(tspan,x0,y0,h1,h2);
%simulacion(x3,y3,equilibrios3);
xlabel("x");
ylabel("y");

%% Ejercicio 4
format long
% simulacion sin caza
z0 = 10000;
L0 = 10000;
a = 0.0001; B = 0.0001;
p1 = @(z,L) 0.1*z*(1-z/10000)-a*z*L;
p2 = @(z,L) 0.25*L*(1-L/6000) - B*z*L;

% equilibrios
equilibrios4 = [0,0;0,6000;10000,0];
L_eq4 = (24*B*10^7 - 6*10^3)/(24*B*a*10^8-1);
Z_eq4 = (0.1-a*L_eq4)*10^5;
equilibrios4 = [equilibrios4;[Z_eq4,L_eq4]];
% condiciones de existencia
ce1 = B>= 0.0004
ce2 = a > 1/(24*B*10^8)
% condiciones de estabilidad
% para (0,6000)
cond1 = a > 0.1/6000
% para el 4to punto de equilibrio
c1 = 2304*(10^17)*(B^2)*(a^2) - 384*(10^13)*(B^2)*a;
c2 = 4*(10^10)*(B^2) - 576*(10^13)*B*a^2;
c3 = 48*(10^9)*B*a-12*(10^5)*B;
c4 = 144*(10^8)*(a^2)+72*(10^4)*a+9;
sigma = sqrt(c1+c2+c3+c4);
cond2 = B*a> 1/(24*10^8)
cond2_1 = a >(sigma+7-2*10^5)/(12*10^4);
cond2_2 = a > (-sigma+7-2*10^5)/(12*10^4)

[x4,y4] = euler(tspan,z0,L0,p1,p2);
%simulacion(x4,y4,equilibrios4);
xlabel("z")
ylabel("L")
title("Grafica de poblacion de zorros y lobos")

% simulacion con caza
k2 = 200; k1 = 300;
p3 = @(z,L) p1(z,L)-k2;
p4 = @(z,L) p2(z,L)-k1;
[x4_2,y4_2] = euler(tspan,z0,L0,p3,p4);
% equilibrios
equilibrios4_2 = [0,0];

%simulacion(x4_2,y4_2,equilibrios4_2)
xlabel("z")
ylabel("L")
title("Grafica de poblacion de zorros y lobos")

%% Funciones
function simulacion(x,y,equilibrios)
for i = 1:length(x)
   figure(1)
   hold on
   plot(x(1:i),y(1:i))
   scatter(equilibrios(:,1), equilibrios(:,2),'*')
   hold off
   pause(0.01)
end
end

function [x,y] = euler(t,x0,y0,f1,f2)
h = t(2)-t(1);
x = [x0,zeros(1,length(t)-1)];
y = [y0,zeros(1,length(t)-1)];
for i = 1:(length(t)-1)
    x(i+1) = x(i)+h*f1(x(i),y(i));
    y(i+1) = y(i)+h*f2(x(i),y(i));
end
end
