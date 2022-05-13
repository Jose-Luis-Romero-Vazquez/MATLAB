% Metodo de Gauss-Seidel
% Programacion Numerica
% Jose Luis Romero Vazquez
% 12/05/21

clc, clear

A=[3 -1 0;-2 1 1;2 -1 4];
b=[2 3 1]';
%La matriz que se propuso para este ejercicio

x=[0 0 0]';
%Valores iniciales para las variables
tol=0.00005;
%Error minimo aceptable para todas las variables
m=20;
%Numero maximo de iteraciones para no hacer largo el proceso

n=length(x);
%Las variables que tenga el sistema
for k=1:m
    y=x;
    %Acumula los resultados del ciclo anterior para despues utilizarlos en
    %el calculo del "error aproximado"
    for i=1:n
        s=A(i,1:i-1)*x(1:i-1)+A(i,i+1:n)*x(i+1:n);
        x(i)=(b(i)-s)/A(i,i);
        %Formula del metodo
        
       E1=(abs(3-x(1))/(3))*100;
       E2=(abs((-2.5-x(2))/(-2.5)))*100;
       E3=(abs(7-x(3))/(7))*100;
       %Se calcula el error relativo
       
       
       ERR1=(abs(((x(1)-y(1))./x(1)).*100));
       ERR2=(abs(((x(2)-y(2))./x(2)).*100));
       ERR3=(abs(((x(3)-y(3))./x(3)).*100));
       %Se calcula el error aproximado
        
    end
    if E1&&E2&&E3 <tol
        return
        %Terminan los ciclos
    end
     
       fprintf('\nTermina iteracion %4.0f\n',k-1)
       fprintf('\nError relativo x1 %f\n',E1)
       fprintf('Error relativo x2 %f\n',E2)
       fprintf('Error relativo x3 %f\n',E3)
       
       fprintf('\nError aproximado x1 %f\n',ERR1)
       fprintf('Error aproximado x2 %f\n',ERR2)
       fprintf('Error aproximado x3 %f\n',ERR3)
       
    fprintf('\n la solucion del sistema en la iteracion %4.0f\n',k)
    %Se mostraran todos los resultados de cada iteracion para corroborar
    %los resultados con el procedimiento hecho a mano
     
    for i=1:n
        fprintf('                  x(%1.0f)=%6.8f\n',i,x(i))
        %Imprime los resultados de x1,x2,x3 con 8 decimales
       
    end
end