%DJ Hinton
%File created September 12, 2017
%IE1070 T, Th 9:30-10:50
%Dr. K
%Project Assignment 1

%The purpose of this file is to display knowledge of 
%the relative frequency definition by simulating coin tosses

clear
clc

%variable initation
objectDefect = 0;

%ask user for number of trials
trials = input('How many trials would you like?: ');


for i=1:1:trials
    
    %random event indicator
    coinFlip = rand;

    if coinFlip < .1
        objectDefect = objectDefect + 1; %there is a defect
    end
    
    %calculating P(A)
    Pa = (objectDefect)/i;
    
    xaxis(i) = i;
    yaxis(i) = objectDefect;
    
end

hold on
%plotting
plot(xaxis,yaxis)

%plotting properties
x_axis='trials';
xlabel(x_axis);
    
y_axis='# of defects';
ylabel(y_axis);
   
plottitle='relative frequency';
title(plottitle);


%slope of best fit line
n=i;
xisum=0;
yisum=0;
xisquare=0;
xiyisum=0;
for i=1:n
xisum=xisum+xaxis(i);
yisum=yisum+yaxis(i);
xisquare=xisquare+xaxis(i)^2;
xiyisum=xiyisum+((xaxis(i)*yaxis(i)));
end
M=[xisum, n; xisquare, xisum];
N=[yisum; xiyisum];
ab=inv(M)*N;
disp(['The slope of best fit line is:', num2str(ab(1))]);



    
    