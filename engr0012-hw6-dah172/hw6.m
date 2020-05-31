%Claire Sattler, DJ Hinton, Jocelyn Hawk R06
%File created January 30, 2016
%Engr 12 T, Th 2:00-3:50
%Vidic
%Homework Assignment 5
%The purpose of this file is to display knowledge of plotting lines of best
%fits with a given data set

clear
clc

answer='y';
while answer=='y' | answer=='Y'

%load file
filename=input('Enter filename: ' , 's')
data=load(filename);
[rows, cols]=size(data);
    
%assign x and y
if cols>rows
    x=data(1,:);
    y=data(2,:);
elseif rows>cols
    x=data(:,1);
    y=data(:,2);
else 
    disp('error in data set')
end

%menu to allow user to choose symbol
shape=menu('What shape do you want the data points to be?','star','circle','square')

%switch case to assign shape to plot
switch shape
    case 1
       color=input('What color do you want the symbols to be?(r=red,g=green,b=blue) ','s')
       
       %if statement to assign color to plot
       if color== 'r'
             plot(x,y,'r*')
       elseif color== 'g'
             plot(x,y,'g*')
       elseif color== 'b'
             plot(x,y,'b*')
       else
             disp('Invalid input')
        end
        
    case 2
        color=input('What color do you want the symbols to be?(r=red,g=green,b=blue) ','s')
       
        %if statement to assign color to plot
        if color== 'r'
             plot(x,y,'ro')
         elseif color== 'g'
             plot(x,y,'go')
        elseif color== 'b'
             plot(x,y,'bo')
        else
            disp('Invalid input')
        end
        
    otherwise
        color=input('What color do you want the symbols to be?(r=red,g=green,b=blue) ','s')
      
        %if statement to assign color to plot
        if color== 'r'
           plot(x,y,'rs')
        elseif color== 'g'
            plot(x,y,'gs')
        elseif color== 'b'
           plot(x,y,'bs')
        else
         disp('Invalid input')
    end
end
disp('View your plot then press any key to continue');
pause;

hold on;
%choose line of best fit
order=menu('choose line of best fit','linear', 'polynomial','spline', 'semi-log', 'log-log');

switch order
    case 1

    y_no0=y(y~=0);



n=length(data);
xisum=0;
yisum=0;
xisquare=0;
xiyisum=0;
for i=1:n
xisum=xisum+x(i);
yisum=yisum+y(i);
xisquare=xisquare+x(i)^2;
xiyisum=xiyisum+((x(i)*y(i)));
end
M=[xisum, n; xisquare, xisum];
N=[yisum; xiyisum];
ab=inv(M)*N;
disp(['The slope is:', num2str(ab(1))]);
disp(['The intercept is:', num2str(ab(2))]);

disp(['y=', num2str(ab(1)), '*x+', num2str(ab(2))])

color2=input('What color would yoou like the line of best fit to be? r=red,g=green,b=blue ','s');
q=max(x);
p=min(x);
xfit=[p: 1 : q];
yfit=ab(1)*xfit+ab(2);
yval=ab(1)*x+ab(2);

hold on
 
if color2=='r'
    plot(xfit,yfit,'r-')
elseif color2=='g'
    plot(xfit,yfit,'g-')
elseif color2=='b'
    plot(xfit,yfit,'b-')
else
    disp('Invalid input')
end



abs_err=abs(y-yval)

%filter the 0 y values
j=1
for i=1:1:13
    if y(i)~=0
     y(j)=y(i)
	 x(j)=x(i)
	 j=j+1
	 end
end

rel_err = abs_err./abs(y);

[max_abs_err,x_loc1] = max(abs_err);
[max_rel_err,x_loc2] = max(rel_err);

disp(['The max absolute error is ', num2str(max_abs_err), ' and is located at x = ' , num2str(x_loc1)])
disp(['The max relative error is ', num2str(max_rel_err), ' and is located at x = ' , num2str(x_loc2)])

sse = sum((y - yval).^2);
sst = sum((y - mean(y)).^2);
rsquared = mean(1 - (sse/sst));
gtext('R-squared = ')
gtext(num2str(rsquared))

gtext('y=')
gtext([num2str(ab(1)), '*x+', num2str(ab(2))])

x_axis=input('Enter x-axis: ', 's');
y_axis=input('Enter y-axis: ' , 's');
plottitle=input('Enter plot title: ', 's');

xlabel(x_axis);
ylabel(y_axis);
title(plottitle);

%estimating a y and an x value
estimation=input('input an x-value: ');
est_answer=ab(1)*estimation+ab(2);

disp(['this is the y-value for your x input: '])
disp(est_answer)

    case 2
        
        
        degree=input('what degree polynomial (1,2,3...)');
    %fit a polynomial
    q=max(x);
    p=min(x);
    delta=(q-p)/300;
    xfit=[p: delta : q];
    coeff=polyfit(x,y,degree);
    yval=polyval(coeff,x);
    yfit=polyval(coeff,xfit);
   
    plot(xfit,yfit)

    %add equations and labels
    eqn1='yHat = ';

    %build eqn for any degree
    for ii=1:degree+1
    %if you are at the last coefficient
        if (ii==degree+1)
    %check sign of coefficient to ensure correct presentation
            if sign(coeff(ii)) > 0
    %x^0 coefficient, i.e., last value
                eqn2=['+',num2str(coeff(ii))];
            else
    %x^0 coefficient, i.e., last value
                eqn2=num2str(coeff(ii));
            end
    %take care of other coefficients
        else
    %check sign of coefficient to ensure correct presentation
            if (sign(coeff(ii)) > 0 && ii~=1)
                eqn2=['+',num2str(coeff(ii)),'x^',num2str(degree+1-ii)];
            else
                eqn2=[num2str(coeff(ii)),'x^',num2str(degree+1-ii)];
            end
    end
%build equation string
    eqn1=[eqn1,eqn2];
    
    abs_err=abs(y-yval)

%filter the 0 y values
j=1
for i=1:1:13
    if y(i)~=0
     y(j)=y(i)
	 x(j)=x(i)
	 j=j+1
	 end
end



rel_err = abs_err./abs(y);

[max_abs_err,x_loc1] = max(abs_err);
[max_rel_err,x_loc2] = max(rel_err);

disp(['The max absolute error is ', num2str(max_abs_err), ' and is located at x = ' , num2str(x_loc1)])
disp(['The max relative error is ', num2str(max_rel_err), ' and is located at x = ' , num2str(x_loc2)])


end
%display equation
gtext(eqn1)
    
  
    x_axis=input('Enter x-axis: ', 's');
    xlabel(x_axis);
    
    y_axis=input('Enter y-axis: ' , 's');
      ylabel(y_axis);
   
     plottitle=input('Enter plot title: ', 's');
    title(plottitle);

    case 3
        
   
        hold on;
        xspl=linspace(min(x),max(x),200);
        splinecoeff=spline(x,y);
        
        
        yspl=ppval(splinecoeff,xspl);
        
        plot(xspl,yspl);
        
        
    case 4
        hold off;
           j=1
    for i=1:1:13
       if y(i)>0
        y(j)=y(i);
    	 x(j)=x(i);
    	 j=j+1;
       end
    end
        ln_y=log(y);
        coeff=polyfit(x,ln_y,1);
        
        a=coeff(1);
        b=coeff(2);
        
        newy=polyval(coeff,x);
        
         
%filter the 0 y values
j=1
for i=1:1:13
    if y(i)~=0
     y(j)=y(i)
	 x(j)=x(i)
	 j=j+1
	 end
end
  q=max(x);
    p=min(x);
    delta=(q-p)/300;
    xfit=[p: delta : q];
    coeff=polyfit(x,y, 1);
    yval=polyval(coeff,x);
    yfit=polyval(coeff,xfit);

    abs_err=abs(y-yval)

rel_err = abs_err./abs(y);

[max_abs_err,x_loc1] = max(abs_err);
[max_rel_err,x_loc2] = max(rel_err);

disp(['The max absolute error is ', num2str(max_abs_err), ' and is located at x = ' , num2str(x_loc1)])
disp(['The max relative error is ', num2str(max_rel_err), ' and is located at x = ' , num2str(x_loc2)])

        
        plot(x,ln_y,'*',x,newy, 'r')
        
        slope=num2str(a);
        intercept=num2str(b);
        
        equation=['ln y = ', slope, 'x', intercept]
        
        gtext(equation);
        
        
        
    case 5
        
        
        j=1
    for i=1:1:13
       if y(i)>0
        y(j)=y(i);
    	 x(j)=x(i);
    	 j=j+1;
	 end
    end
      
    q=max(x);
    p=min(x);
    delta=(q-p)/300;
    xfit=[p: delta : q];
    coeff=polyfit(x,y, 1);
    yval=polyval(coeff,x);
    yfit=polyval(coeff,xfit);

    abs_err=abs(y-yval)

rel_err = abs_err./abs(y);

[max_abs_err,x_loc1] = max(abs_err);
[max_rel_err,x_loc2] = max(rel_err);

disp(['The max absolute error is ', num2str(max_abs_err), ' and is located at x = ' , num2str(x_loc1)])
disp(['The max relative error is ', num2str(max_rel_err), ' and is located at x = ' , num2str(x_loc2)])

        
        
        hold off;
  
        
        ln_x=log(x);
        ln_y=log(y);
        coeff=polyfit(ln_x,ln_y,1);
        a=coeff(1);
        b=coeff(2);
        
        newy=polyval(coeff,ln_x);
        plot(ln_x,ln_y, '*',ln_x,newy, 'r')
        slope=num2str(a);
        intercept=num2str(b);
        equation=['lny= ',slope,'ln(x) + ',intercept];
        gtext(equation)
        
end
answer = input('Do you want to check another file? y/n ' , 's'); %begin loop
while answer ~= 'y' && answer ~= 'n'
    answer = input('Do you want to check another file? y/n ' , 's');
end
end