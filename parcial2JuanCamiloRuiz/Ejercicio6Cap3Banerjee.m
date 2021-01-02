clear 
close all
clc


% deltaT = 0.01;

deltaT = 0.1;

maxTime = 100;

alpha = 0.1;

beta = 0.001;

K = 1000;

% r = 0.5; % oscillations
 
% r = 0.25; % oscillations

r = 0.1;   % no oscillations


delta = 0.0005;


preyEq1 = 0;
predEq1 = 0;

preyEq2 = K + r/delta;
predEq2 = (alpha*r + alpha*delta*K)/(beta*r);


%%%%%%%%%%%%%%%%%%%
oscillations = (alpha<(4*r^3+4*r^2*delta*K)/(delta^2*K^2));

%%%%%%%%%%%%%%



equilibriaPrey = [preyEq1,preyEq2];
equilibriaPred = [predEq1,predEq2];

popIniPrey = 1500;
popIniPred = 1000;

times = deltaT:deltaT:maxTime;

popPrey = zeros(length(times)+1);
popPred = zeros(length(times)+1);

popPrey(1) = popIniPrey;
popPred(1) = popIniPred;

%%
counter = 1;
for t = times 
   currentPrey =  popPrey(counter);
   currentPred = popPred(counter);
   
   nextPrey = currentPrey + deltaT*(alpha*currentPrey - beta*(currentPrey-K)*currentPred);
   nextPred = currentPred + deltaT*(-r*currentPred + delta*(currentPrey-K)*currentPred);
    
   counter = counter+1;
   popPrey(counter) = nextPrey;
   popPred(counter) = nextPred;
   
   figure(1)
   hold on
   plot(popPrey(1:counter),popPred(1:counter))
   scatter(equilibriaPrey,equilibriaPred,'*')
   hold off
   
   pause(0.01)
    
end








