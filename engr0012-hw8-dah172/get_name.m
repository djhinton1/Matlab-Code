function [filename]=get_name ()

%asks for file name
filename=input('Enter filename: ','s');


%filename error check
while exist(filename) == 0
    disp(' ');
    disp('file does not exist, please try again')
    filename=input('Enter filename: ','s');
    
end
end
