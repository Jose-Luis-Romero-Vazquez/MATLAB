% Metodo de Secante
% Programacion Numerica
% Jose Luis Romero Vazquez
% 12/04/21

clear
clc
format shortG

x1=0
x2=1
err=0.05
ea=100;
i=0;

fprintf('Iteracion :          Raiz:      Error Abs:   Error Relativo: ')
while i<4
    
    xi=x2-(((exp(-x2)-x2)*(x1-x2))/((exp(-x1)-x1)-(exp(-x2)-x2)));
    ea=abs(((x1-x2)/xi)*100);
    E2=(abs(0.567143290-xi)/(0.567143290))*100;
     disp ([i, xi, ea,   E2])
  
  
    %el 8.4f es para saber el numero decimales, 8 enteros y 4 decimales. La
    %barra invertida n es el espacio
    x1=x2;
    x2=xi;
    %el contador va a ir aumentado una unidad por cada iteracion
    i=i+1;
    
    
end

fprintf('\nRaiz de la funcion:%8.5f\nCalculada en %4f iteraciones\n',xi,i)

x=0:0.01:10
f=exp(-x)-x
plot (x,f)
grid on