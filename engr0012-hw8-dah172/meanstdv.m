function[datamean,stdv,datarow]=meanstdv(data,row)
datarow=input('Please enter the row of data you would like to evaluate: ');

%error check for row value
while datarow > row | datarow < 1
    disp(' ');
    disp('that is an invalid row, please try again.')
    datarow=input('Please enter the row of data you would like to evaluate: ');
end


%computes values from specfied row
newdata=data(datarow,:);
datamean=mean(newdata);
stdv=std(newdata);
end

        