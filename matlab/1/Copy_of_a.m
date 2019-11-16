clc;
clear all;


capasity = 1;
R = 100;


n = zeros (1,10);
r = 10 * (1:10);

for i = 1 : 10
    plotcircle(r(i))
end
    

for N=100 : 150
capacity = 1;
n = zeros (1,10);
r = 10 * (1:10);

density = N/(pi*R^2);

clip = 0;
tetha = [];
ro = [] ;
for i = 1: N;
    tetha =[tetha 2*pi*rand(1)];
    ro =[ro R*sqrt(rand(1))];
end
[X,Y] = pol2cart(tetha,ro);
    hold on
    plot(X,Y,'bo');
    axis square;



i = 1;
while capasity>0
    if (i==1)
        n(i) = sum(ro <= r(i));
    else
        n(i) = sum(ro <= r(i) & ro>r(i-1));
    end
    capasity = capasity - (n(i)*(i/100));
    fprintf('n(%d) = %d \n',i,n(i));
%  
    disp('capasity = ');   
    disp(capasity);
    if capasity <0 
        clip = i;
        break;
    end
    i = i+1;
   
end
disp('clip = ');
disp(clip);

end;




