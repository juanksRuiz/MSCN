r = [0.5,0.7,0.2];
thetaX0 = [1.2, 0.55, 0.45];
N = 100;
phi = zeros(N,3);
for n = 1:(N-1)
    phi(n+1,:) = phi(n,:) + r.*(1- phi(n,:)).*(1-phi(n,:)./thetaX0);
end

stability_cond1 = r < 2./((1./thetaX0)-1) 
stability_cond2 = r < 2./(1-(1./thetaX0))
plot(1:N,phi)
xlabel("n")
ylabel("phi_n")
grid on

legend("r=0.5, theta/X0 = 1.2",...
    "r=0.7, theta/X0 = 0.55",...
    "r=0.2, theta/X0 = 0.45")
