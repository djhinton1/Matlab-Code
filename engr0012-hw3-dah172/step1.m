clear
clc

%Dj Hinton, Clair, M
%Engineering 0012, Vidic 2pm
%Jan. 24, 2017
%Homework 3
%This script finds the basic statistical information )such as mean, median, and variance) of the data sets
%given.

check='y';
while check == 'y'


%LOADING THE DATA

%step 1
    %file 1
filename1=input('file(one) name: ','s');
while exist(filename1) == 0
    disp('The file does not exist')
    filename1=input('Enter the data file name: ','s');
end
data1=load(filename1);

    %file2
filename2=input('file(two) name: ','s');
while exist(filename2) == 0
    disp('The file does not exist')
    filename2=input('Enter the data file name: ','s'); 
end
data2=load(filename2);








%FINDING THE MEAN OF BOTH DATA SETS

%step 2
    %file 1
datatotal1=data1(1);
Q=length(data1);
for i=2:1:Q
    datatotal1=datatotal1+data1(i);
end

    %file2
datatotal2=data2(1);
W=length(data2);
for i=2:1:W
    datatotal2=datatotal2+data2(i);
end
   

mean_file1=datatotal1/Q;
mean_file2=datatotal2/W;
disp(['the mean for data 1 is:',num2str(mean_file1)])
disp(['the mean for data 2 is:',num2str(mean_file2)])







%FINDING THE MAX ND MIN OF BOTH DATA SETS

%step 3
    %file 1
min_file1=data1(1);
Q=length(data1);
for i=2:1:Q
    if min_file1<data1(i)
        min_file1=min_file1;
    else
        min_file1=data1(i);
    end
end


max_file1=data1(1);
for i=2:1:Q
    if max_file1>data1(i)
        max_file1=max_file1;
    else
        max_file1=data1(i);
    end
end

    %file2
min_file2=data2(1);
Q=length(data2);
for i=2:1:W
    if min_file2<data2(i)
        min_file2=min_file2;
    else
        min_file2=data2(i);
    end
end


max_file2=data2(1);
for i=2:1:W
    if max_file2>data2(i)
        max_file2=max_file2;
    else
        max_file2=data2(i);
    end
end


disp(['the file 1 minimum is:',num2str(min_file1)])
disp(['the file 1 maximum is:',num2str(max_file1)])
disp(['the file 2 minimum is:',num2str(min_file2)])
disp(['the file 2 maximum is:',num2str(max_file2)])




%FINDING THE MEDIAN OF BOTH DATA SETS

%step 4
%file 1
datasort1=sort(data1);
middle1=Q/2;
remainder1=mod(Q,2)
remainder2=mod(W,2)

if remainder1 == 0
    av_mid=(datasort1(middle1)+datasort1(middle1+1))/2
    med_file1=av_mid
else
    med_file1=datasort1(ceil(middle1))
end


    
    %file2
datasort2=sort(data2);
middle2=W/2;
roundmid2=ceil(middle2);
med_file2=datasort2(roundmid2);

disp(['file 1 median is:',num2str(med_file1)])
disp(['file 2 median is:',num2str(med_file2)])





%FINDING THE VARIANCE VALUE AND STDEV

%step5&6
    %file 1
    meandata1=mean(data1);
sumsquared1=(data1(1)-meandata1).^2;
for i=2:1:length(data1)
    sumsquared1=sumsquared1+(data1(i)-meandata1).^2;
end
sumsquared1;
varvalue2_file1=sumsquared1/(length(data1)-1);
stdev_file1=sqrt(varvalue2_file1);
    
    %file2
meandata2=mean(data2);
sumsquared2=(data2(1)-meandata2).^2;
for i=2:1:length(data2)
    sumsquared2=sumsquared2+(data2(i)-meandata2).^2;
end
sumsquared2;
varvalue2_file2=sumsquared2/(length(data2)-1);
stdev_file2=sqrt(varvalue2_file2);

disp(['file 1 variance is:',num2str(varvalue2_file1)])
disp(['file 1 standard deviation is:',num2str(stdev_file1)])
disp(['file 2 variance is:',num2str(varvalue2_file2)])
disp(['file 2 standard deviation is:',num2str(stdev_file2)])






%CREATING THE HISTOGRAMS

%step7&8
nbins=input('Enter number of bins: ');
    %file1
minval1=min(data1);
maxval1=max(data1);
range1=maxval1-minval1
delta1=range1/nbins,
 
temp1=minval1: delta1: maxval1; 
uboundbins1=(temp1(2:nbins+1)); 
frequency=zeros(1,nbins);


%Q=length of data
%sorting into bins
for j = 1:nbins
    for i=1:Q 
        if j == 1
            if data1(i) <= uboundbins1(j) 
               frequency(j)=frequency(j)+1;
            end
        else
            if ((data1(i) > uboundbins1(j-1)) & (data1(i) <= uboundbins1(j)))
            frequency(j)=frequency(j)+1; 
            end
        end
    end
end



%plotting both sets of data
subplot(1,2,1), bar(uboundbins1,frequency,1)
x_label=input('x-axis label?: ','s');
y_label=input('y-axis label?: ','s');
xlabel(x_label)
ylabel(y_label)
title('Using the Bar Command')


subplot(1,2,2), hist(data2, nbins)
x_label=input('x-axis label?: ','s');
y_label=input('y-axis label?: ','s');
xlabel(x_label)
ylabel(y_label)
title('Using the Hist Command')

message=input('Text on graph?: ','s');
gtext(message)


%checkpoint
check=input('Would you like to enter a new set of data?(y/n): ','s');
if check == 'y'
    check='y';
elseif check == 'n'
    check='n';
else
    disp('That is an invalid character, please try again.(y/n): ','s')
end
end

    
    
    
    
    
