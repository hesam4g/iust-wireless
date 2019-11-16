function a = plotaxis(r)

    X1 = -r:r;
    Y1 = zeros(1,1+2*r);
    plot (X1,Y1,'k-');
    hold on;
    X2 = zeros(1,1+2*r);
    Y2 = -r:r;
    plot (X2,Y2,'k-');
    hold on;
    a=1;
end