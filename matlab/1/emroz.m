d = 1:100;
z = norminv(.90);
sigma = 7;


s0 = -10 -40;
s = s0 - 10*3*log10(d)-(z*sigma);

n = 10*log10(41.4*10^(-16));
sn = s - n;


