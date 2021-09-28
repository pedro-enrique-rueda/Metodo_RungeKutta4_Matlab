function [tabla] = metodo_RK4(x,y,h,n)
%   Metodo RK4    
    xx =[];
    yy = [];
    
    for i = 1:n
        
        xx(i) = x;
        yy(i) = y;
        
        k1 = funcion(x,y);
        k2 = funcion(x + h/2, y + k1*h/2);
        k3 = funcion(x + h/2, y + k2*h/2);
        k4 = funcion(x + h, y + k3*h);
        
        y = y + (1/6) * (k1 + 2*k2 + 2*k3 + k4) * h;
        x = x + h;
        if(i==n)
            xx(i) = x;
            yy(i) = y;
        end
    end
    
    tabla = table(xx',yy','VariableNames',{'x','y'});
    
    figure()
    plot(xx,yy,'ro')
    
    return 
end