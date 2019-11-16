p = [0:0.01:1];
N = 10;

pool=1-(1-p).^N-10*(1-p).*p.*(1-p).^(N-1);

idle=1./(1-(1-p).^N);
plot(p,pool);
grid;
hold;
plot(p,idle);
grid;
hold;