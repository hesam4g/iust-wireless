function a = plotcircle(r)

    numPoints = 100;
    radius= r;
    theta=linspace(0,2*pi,numPoints); 
    rho=ones(1,numPoints)*radius;

    [X,Y] = pol2cart(theta,rho);
    hold on
    plot(X,Y,'k-');
    axis square;
    a=1;
end