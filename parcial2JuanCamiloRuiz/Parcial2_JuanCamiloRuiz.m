% Ejercicio 1
syms r k B a s g;
J = @(x,y) [r*(1-(2*x/k)) - (B*y*a)/((x+a)^2), -(B*k)/(k+a); 0,s ];
% J(k,0) bien
A = r - (a*r)/k - B*g;
x2 = ((2*k)/r)*(A + sqrt(A^2 + 4*a*(r^2)/k));
y2 = g*x2;

J(x2,y2)





