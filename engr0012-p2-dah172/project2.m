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

x = [0,1,2,3,4,5,6,7,8,9,10];
y = [];

for (i = 1:1:11)
    y[i] = exp(-.5)*((.5^x[i])/factorial(x[i]))
end



    