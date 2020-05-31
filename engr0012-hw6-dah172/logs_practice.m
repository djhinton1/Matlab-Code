clear
clc

% define variables
x=[1 2 3 4 5 6 7]
y=[1.1 3.0 8.0 21.8 59.4 161.4 438.6] 

%change y to ln(y) for fitting 
ln_y=log(y)

%plot ln_y verses x
plot(x,ln_y,'r*')
xlabel('x')
ylabel('ln y')

%fit straight line through x and ln_y 
coeff=polyfit(x,ln_y,1)



hold on


clear







%log-log graph

% define variables
x=[1 2 3 4 5 6 7]
y=[2 9.2 22.4 42.2 69.0 103.0 144.6] 

%change y to ln(y) and x to ln(x) for fitting 
ln_y=log(y)
ln_x=log(x)

%plot ln_y verses ln_x
plot(ln_x,ln_y,'r*')
xlabel('ln x')
ylabel('ln y')

%fit straight line through ln_x and ln_y
coeff=polyfit(ln_x,ln_y,1)