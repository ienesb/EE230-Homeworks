clear all;
close all;
clc;

N = [1, 5, 10, 25, 50, 75, 100, 250, 500, 750, 1000];
A = (-100:100)/20;
deltaN = [];
stdcdf = normcdf(A);

for n = N
    deltaN(end + 1) = max(poisscdf(A*sqrt(n) + n, n) - stdcdf);
end 

figure;
plot(log(N), deltaN);

grid minor;
xlabel("ln(n)");
ylabel("∆(n)");
title("∆(n) vs ln(n)")

figure;
plot(log(N), deltaN.*sqrt(N));
hold on;
plot(log(N), ones(length(N))*max(deltaN.*sqrt(N)), "k-")
grid minor;
xlabel("ln(n)");
ylabel("∆(n)√n");
title("∆(n)√n vs ln(n)")