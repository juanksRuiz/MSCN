function dy = ODE_ej1(t,y,r,k,B,a,s,g)
dy(1,1) = r*y(1)*(1-y(1)/k) - ((B*y(1)*y(2))/(y(1)+a));
dy(2,1) = s*y(2)*(1-y(2)/(g*y(1)))
end