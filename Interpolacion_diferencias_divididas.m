% Interpolacion de Newton con diferencias divididas
% Programacion Numerica
% Jose Luis Romero Vazquez
% 24/05/21

clc, clear

x=[1 2 4 5];
%Valores en x de entrada
y=[0 0.693 1.386 1.609];
%Valores en y de entrada
xi=3;
%Valor para evaluar el polinomio una vez obtenido por el metodo

n=length(x);
%Elementos del vector
b=zeros(n);
%Inicializar en cero la matriz
b(:,1)=y(:);
%Rellenar la columna 1 con los datos de "y"
disp('La tabla con las diferencias divididas es la siguiente(en el orden que se dio en clase) :')
disp('*Columna/Fila:*')
for j=2:n
    %Se empieza a rellenar desde la 2da columna (la primera son los valores
    %en y)
    for i=1:n-j+1
        %Se escribiran los datos de tal manera que se haga una "semi-piramide
        %invertida ya que cada renglon contara con un dato menos)
        b(i,j)=(b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
        %Formula para este metodo
        fprintf('En la casilla(%d, %d) ', j, i)
        fprintf('\nEl coeficiente es: %f\n',b(i,j))
        %Para mostrar los datos de la tabla
    end
end

%Para evaluar el polinomio
yi=(b(1,1)+(b(1,2).*(xi-x(1)))+(b(1,3).*(xi-x(1)).*(xi-x(2)))+(b(1,4).*(xi-x(1)).*(xi-x(2)).*(xi-x(3))));
fprintf('\nLa funcion evaluada en el punto elegido vale: %f\n',yi)

%Se genera el polinomio calculado
disp('La interpolacion es:')
     X = [num2str(b(1,1)),' + ',num2str(b(1,2)),' * ','(x -',num2str(x(1)),') ',' + ',num2str(b(1,3)),' * ','(x -',num2str(x(1)),') ',' * (x -',num2str(x(2)),') ',' + ',num2str(b(1,4)),' * ','(x -',num2str(x(1)),') ',' * (x -',num2str(x(2)),')',' * (x -',num2str(x(3)),')']

%Se realiza la grafica
x1=0:0.1:10;
f=(b(1,1)+(b(1,2).*(x1-x(1)))+(b(1,3).*(x1-x(1)).*(x1-x(2)))+(b(1,4).*(x1-x(1)).*(x1-x(2)).*(x1-x(3))));
plot (x1,f)

text(xi,yi,'\leftarrow El punto evaluado en la interpolacion')

grid on;
hold on
f2 = log(x1); 
plot (x1,f2)

txt = 'El valor real \rightarrow';
text(xi,log(xi),txt,'HorizontalAlignment','right')
txt2 = 'Estimacion \rightarrow';
text(xi+6,2.24,txt2,'HorizontalAlignment','right')
text(xi+6,log(xi+6),'\leftarrow f(x)=lnx')

