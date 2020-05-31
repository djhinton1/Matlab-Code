clear
clc

xpts= [0, 1, 2, 3, 4, 5, 6]
ypts=[0.2, 0.8, 8.3, 6.1, 14.3, 43.6, 33.9]
coeff= polyfit(xpts,ypts,1); 
xline=linspace(0,6,100); 
yline=polyval(coeff,xline);
plot(xpts, ypts,'r*', xline, yline);

disp('hit any key to continue')

hold on

pause;


order=input('type the order: ');

xnew=[3.3,4.6]
   %fit a polynomial
    q=max(xpts);
    p=min(xpts);
    delta=(q-p)/300;
    xfit=[p: delta : q];
    coeff=polyfit(xpts,ypts,order);
    yfit=polyval(coeff,xfit);
    
    %evaluation ot certain points
    ynew = polyval(coeff,xnew)
    
    plot(xfit,yfit)


splinecoeff=spline(xpts,ypts);
xspl=linspace(min(xpts),max(xpts),100);
yspl=ppval(splinecoeff,xspl);

%evaluation at certain points
ysnew = ppval(splinecoeff, xnew)

plot(xspl,yspl,'g--')


xi1=[3.3,4.6];
yi1=interp1(xpts,ypts,xi1)
