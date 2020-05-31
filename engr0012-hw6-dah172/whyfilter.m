%this is how you filter values from the x array
%as well as the y array at the same time
%necessary because numbers may be imaginary

x = [ 1, 2, 3, 4, 5, 6, 7 ];
y = [ 10, 6, 3, 1, 0, -0.5, -0.7] 


%subplot(1, 2, 1), plot(x, y,'*') 
%subplot(1, 2, 2), plot(x, ln_y, '*')

%the plots above cause problems because the
%y-values are '0' or negative and will result
%in imaginary numbers 


%filters out negative and '0' numbers because
%you cannot take the ln of a negative number
%so by removing them, you can procede

j = 1
for i=1:length(y)
    if y(i) > 0
        y_fit(j) = y(i)
        x_fit(j) = x(i)
        
        j = j + 1
    end
end

ln_y_fit=log(y_fit);

subplot(1, 2, 1), plot(x_fit, y_fit,'*')
subplot(1, 2, 2), plot(x_fit, ln_y_fit, '*')