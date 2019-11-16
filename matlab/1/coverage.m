clear all;
clc;
% plot bit/sec and distance two dimentional curve
d = [1:500];

K = 1.38e-23;%bultezman
T = 300;%kelvin
N0 = K*T;
B = 1e6;%bandwith
N =10*log10(N0*B*1000);%noise DBm wat


n = 3;
sigma = 7;
pl0=40;



z = norminv(.95,0,1);


ptx = 10*log10(5);
S= ptx - pl0 - 10*n*log10(d)- z*sigma;
SNR = S-N;

SNR0=[0 13 13 17 21 23 27 30 32 36 38];


R = [];
for snr=SNR
    R =[R sum(snr>=SNR0)*B];
end

plot(d,R/1e6,'k-s');