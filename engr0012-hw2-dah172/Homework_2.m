%Dj Hinton
%Homework #2
%January 19, 2017


again='y';
while again=='y';
clear
clc
disp('This is a program designed to solve linear matricies with data given from the filename below.')

%load file
filename=input('filename?: ','s');
while exist(filename) == 0
    disp('The file does not exist.')
    filename=input('filename?: ','s');
end
ages=load(filename);


%determine matrix size
[rows, cols]=size(ages);
if rows > cols
    disp('The data is stored in rows')
elseif cols > rows
    disp('The data is stored in columns')
else
    disp('There is an error in the data set.')
end

%inverts matrix and computes x
if rows > cols
    ages = ages';
    [rows, cols]=size(ages);
    A = ages(:,1:cols-1);
    b = ages(:, cols);
    x = inv(A)*b
    

    %computes x from given matrix
elseif cols > rows
    A = ages(:,1:cols-1);
    b = ages(:, cols);
    x = inv(A)*b
    

    %notification of error
else
    disp('Error in data.')
    
end
again=input('Woud you like to do another caluclation? y/n: ','s');
end
    

