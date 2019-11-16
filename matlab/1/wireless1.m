k = 1.38e-23;
T = 300;
n = 3;
sigma = 7;
N0 = k*T;
PL0 = 40;
B = 1e6;
N = 10*log10(N0*B*1000);
ptx = 10 *log10(100/20);
z = norminv(0.95,0,1);
d = [1:500];
S = ptx - PL0 - 10*n*log10(d) - z*sigma;
SNR0 = [13 13 17 21 23 27 30 32 36 38]; %0000000000000
%M = 2:1:10;
%plot (d, S-N,'-k');
%grid;
SNR = S - N;
R =1:500;
i = 1;
for snr = SNR
    R(i) = sum(snr>=SNR0)*B;
    i = i + 1;
end

plot (d,R/1e6,'-ks');
grid;