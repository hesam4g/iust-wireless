clc;
clear;
close all;

SNR=0:0.01:30;
W=10^6;
C=W*log10(1+SNR);
figure;
subplot(2,1,1)
plot(SNR,C)
title('Shanon Capacity')
ylabel('Bit/sec')
xlabel('SNR')
syms x;
A=[2 4 8 16 32 64 128];
for i=1:7
    M=A(i);
SNR2(i)=solve(3*log2(M)/(M-1)*x - qfuncinv(10^(-6)/(2*(1-1/sqrt(M)))),x);
end
C=W*log10(1+SNR2);
subplot(2,1,2)
plot(SNR2,C,'or-')
title('Requried C for BER=10^-6')
ylabel('Bit/sec')
xlabel('SNR')
