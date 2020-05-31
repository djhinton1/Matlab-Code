clear
clc


%Claire Sattler, DJ Hinton, Jocelyn Hawk R06
%File created Febuary 7, 2016
%Engr 12 T, Th 2:00-3:50
%Vidic
%Homework Assignment 8
%The purpose of this file is to make simple somputations using created
%functions. 



%calls the function to display a header
header()



temp='y';
while temp == 'y' | temp == 'Y'
%loads the data by way of 2 functions ('get_name', and 'load_data')
[filename] = get_name ();
disp(filename)
[data]=load_data(filename)





%determins the size of data to 
%specify how many rows are avaiable to pick from.
[row,col]=size(data);





%determins the mean and stdv by way of function 'mean stdv'
[datamean,stdv,datarow]=meanstdv(data,row);





%displays computations by way of function'display_data'
display_data(datamean,stdv,datarow)


%different file?
temp=input('Would you like to try a different data set? (y/n) ','s');
while temp ~= 'y' && temp ~= 'Y' && temp ~= 'n' && temp ~= 'N'
    disp(' ');
    disp(' ');
    disp('That is not an acceptable input, please try again: ')
    temp=input('Would you like to try a different data set? (y/n) ','s');
end
end




