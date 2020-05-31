filename=input('filename?: ','s');
data=load(filename);

color=menu('please choose a color','red','blue','green')
type=menu('please choose a type','star','square')

switch color
    case 1
        switch type
            case 1
                plot(data,'r*')
            otherwise
                plot(data,'rs')
        end
        
    case 2
        switch type 
            case 1
                plot(data,'b*')
            otherwise
                plot(data,'bs')
        end
        
    otherwise
        switch type
            case 1
                plot(data,'g*')
            otherwise
                plot(data,'gs')
        end
        
end

