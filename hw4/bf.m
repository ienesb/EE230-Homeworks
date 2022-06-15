clear all;
close all;
clc;

A = (-100:100)/20;
N = [1, 10, 100, 1000];

for n = N
    cdf = poisscdf(A*sqrt(n) + n, n);
    plot(A, cdf);
    hold on;
end 

cdf = normcdf(A);
plot(A, cdf);
grid minor;
xlabel("A");
ylabel("CDF");
title("CDF")
legend("n = 1", "n = 10", "n = 100", "n = 1000", "std normal");
