close all;
clear all;
clc;

sigma_x=1;
sigma_y=1;
N=1e5;
rhos = -1:0.1:1;
mses_s = [];
mses_t = [];

for rho = rhos
    R=[sigma_x^2  rho*sigma_x*sigma_y  ;  rho*sigma_x*sigma_y  sigma_y^2];
    Z=R^0.5*randn(2,N);

    X=Z(1,:);
    Y=Z(2,:);
    X_hat = Y*rho*sigma_x/sigma_y;

    mse_s = sum((X - X_hat).^2)/N;
    mse_t = (1-rho^2)*sigma_x;
    
    mses_s(end+1) = mse_s;
    mses_t(end+1) = mse_t;
end


subplot(2,1,1);
plot(rhos, mses_t);
grid minor;
xlabel("rho");
ylabel("MSE");
title("MSE vs rho (theoretical)");

subplot(2,1,2);
plot(rhos, mses_s);
grid minor;
xlabel("rho");
ylabel("MSE");
title("MSE vs rho (simulation)");