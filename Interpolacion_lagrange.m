% Polinomio de interpolacion de Lagrange
% Programacion Numerica
% Jose Luis Romero Vazquez
% 26/05/21

clc, clear

%xs=[1 3 5 7 13];
%ys=[800 2310 3090 3940 4755];
xs=[5 7 13];
ys=[3090 3940 4755];
%xs=[7 13];
%ys=[3940 4755];
x=10;

n=length(xs);

yi=0;
pol='0';
%Para contruir la funcion, se inicializa en 0 donde se alamacenaran los
%coeficientes y texto que lo componen

%Calcular los n factores de lagrange
for i=1:n
%cada factor es el producto de (x-xj)/(xi-xj) donde i sea distinto de j  
    producto=ys(i);
    termino=num2str(ys(i));
    %Convertir a texto 
    for j=1:n
        if i~=j
            producto=producto*(x-xs(j))/(xs(i)-xs(j));
            %Calculo de los productos de f(x) por las diferencias
            termino=strcat(termino,'*(x-',num2str(xs(j)),')/(',num2str(xs(i)),'-',num2str(xs(j)),')');
            %Se concatenan los termino que componen la funcion para que al
            %final se puede conocer la funcion
        end
    end
    %sumar cada termino (todos los productos con el valor anterior)
    yi=yi+producto;
    pol=strcat(pol,'+',termino);
    %Concatena los terminos para dar como resultado final la funcion del
    %polinomio
end
fprintf('\nEl valor faltante segun el polinomio calculado es: %f\n',yi)
disp('El polinomio obtenido es:')
pol



x1=0:0.1:15;

%1er grado
f1=0+3940.*(x1-13)/(7-13)+4755.*(x1-7)/(13-7);%con 7 y 13

%2do grado
f2=0+3090.*(x1-7)/(5-7).*(x1-13)/(5-13)+3940.*(x1-5)/(7-5).*(x1-13)/(7-13)+4755.*(x1-5)/(13-5).*(x1-7)/(13-7);%con 5,7 y 13

%3er grado
f3=0+2310.*(x1-5)/(3-5).*(x1-7)/(3-7).*(x1-13)/(3-13)+3090.*(x1-3)/(5-3).*(x1-7)/(5-7).*(x1-13)/(5-13)+3940.*(x1-3)/(7-3).*(x1-5)/(7-5).*(x1-13)/(7-13)+4755.*(x1-3)/(13-3).*(x1-5)/(13-5).*(x1-7)/(13-7);%Con 3,5,7 Y 13

%4to grado (Con 1,3,5,7 y 13)
f4=0+800.*(x1-3)/(1-3).*(x1-5)/(1-5).*(x1-7)/(1-7).*(x1-13)/(1-13)+2310.*(x1-1)/(3-1).*(x1-5)/(3-5).*(x1-7)/(3-7).*(x1-13)/(3-13)+3090.*(x1-1)/(5-1).*(x1-3)/(5-3).*(x1-7)/(5-7).*(x1-13)/(5-13)+3940.*(x1-1)/(7-1).*(x1-3)/(7-3).*(x1-5)/(7-5).*(x1-13)/(7-13)+4755.*(x1-1)/(13-1).*(x1-3)/(13-3).*(x1-5)/(13-5).*(x1-7)/(13-7);

%*Inician graficas*

%1er grado
%Con 7 y 13
figure(1)
plot(x1,f1)

text(1,800,'\leftarrow El punto 1,800')
text(3,2310,'\leftarrow El punto 3,2310')
text(5,3090,'\leftarrow El punto 5,3090')
text(7,3940,'\leftarrow El punto 7,3940')
text(13,4755,'\leftarrow El punto 13,4755')
grid on;

%2do grado
%Con 5,7 y 13
figure(2)
plot (x1,f2)
text(1,800,'\leftarrow El punto 1,800')
text(3,2310,'\leftarrow El punto 3,2310')
text(5,3090,'\leftarrow El punto 5,3090')
text(7,3940,'\leftarrow El punto 7,3940')
text(13,4755,'\leftarrow El punto 13,4755')
grid on;

%3er grado
%Con 3, 5, 7 Y 13
figure(3)
plot (x1,f3)
text(1,800,'\leftarrow El punto 1,800')
text(3,2310,'\leftarrow El punto 3,2310')
text(5,3090,'\leftarrow El punto 5,3090')
text(7,3940,'\leftarrow El punto 7,3940')
text(13,4755,'\leftarrow El punto 13,4755')
grid on;

%4to grado (Con 1,3,5,7 y 13)
figure(4)
plot (x1,f4)
text(1,800,'\leftarrow El punto 1,800')
text(3,2310,'\leftarrow El punto 3,2310')
text(5,3090,'\leftarrow El punto 5,3090')
text(7,3940,'\leftarrow El punto 7,3940')
text(13,4755,'\leftarrow El punto 13,4755')
grid on;

