function p = Lagrange(x,y,mostrarPasos)
    global t pasito coef;
    coef = '';
    p=0;
    t = sym('x'); % creo la variable simbólica x para reemplazar en la función
    n = length(x);
    
    for i=1:n
        L=1;
        for j=1:n
            if i ~= j
                L = L*(t-x(j))/(x(i)-x(j));
            end
        end
        if (i == 1)
        %if (mostrarPasos == 1)
            pasito=strcat("L", num2str(i-1),"(x) = ", char(L));
            disp(strcat("L", num2str(i-1),"(x) = ", char(L)));
        %end
        else
            pasito=pasito + newline + "L" + num2str(i-1) + "(x) = "+ char(L);
            disp(strcat("L", num2str(i-1),"(x) = ", char(L)));
        end
        p = p+L*y(i);
        p= simplify(p);        
    end
    %if (mostrarPasos == 1)
    disp('El grado del polinomio es:');
    disp(polynomialDegree(p));
    if(sonPuntosEquiespaciados(x))
        disp('Los puntos ingresados son equiespaciados');
    else
        disp('Los puntos ingresados NO son equiespaciados');
    end
     %   end            
end
