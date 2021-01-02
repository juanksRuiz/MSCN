x = 0:8;
y = [1,2.1,2.8,3.6,5,5.5,8.0,6.4,7.4];

[sumX, sumY, sum_x_iy_i, sum_xi_sq] = results(x,y);
sumX, sumY, sum_x_iy_i, sum_xi_sq


function [sumX, sumY, sum_x_iy_i, sum_xi_sq] = results(x,y)
% x: lista con coordenadas x
% y: lista con coordenadas y

sumX = sum(x);
sumY = sum(y);
sum_x_iy_i=sum(x.*y);
sum_xi_sq = sum(x.^2);
end

