% Eliminacion simple de Gauss
% Programacion Numerica
% Jose Luis Romero Vazquez
% 03/05/21

clc, clear
n= input('¿Cuantas ecuaciones desea ingresar?: ');

%Reservamos espacio para hacer mas optimo el programa
M=zeros(n,n); b= zeros(n,1); X=b;

%Se leera la matriz de coeficientes
disp('A continuacion escriba los coeficientes de la matriz')
for i=1:n
    for j=1:n
        %Este doble "for" es necesario para leer tanto los datos segun el
        %renglon y columna ingresados
        fprintf('Ingrese un valor para la casilla(%d, %d): ', i, j)
        M(i, j) = input('');
        %A "input" no se le agrega ningun mensaje, porque lo que regularmente se le
        %pasa es un valor, pero no va ascendiendo el numero que lo va
        %clasificando en el renglon y columna dados, por eso se hace uso de
        %un "fprintf" que vaya almacenando en "%d" el numero del renglon y
        %columna para que el usuario conozca en que casilla esta asignando
        %los datos
        
    end
end
disp('A continuacion escriba el vector columna b (los resultados de la ecuacion)')
for i=1:n
    %Solo hace falta leer los renglones, por ende solo hace falta un "for"
    fprintf('Ingrese un valor para el renglon b(%d) ',i)
    b(i) = input('');
   
end

%Se forma la matriz ampliada
A=[M,b];

%Se realiza la eliminacion hacia adelante
%Se haran "ceros" todos los elementos debajo de la diagonal principal
for j=1:n-1
    for i=j+1:n
        A(i,:) = A(i,:)+A(j,:)*(-A(i,j)/A(j,j));
        %Los "dos puntos" hacen que se tome todas columnas de la fila en la
        %que se esta trabajando
    end
end

%Se realiza la sustitucion hacia atras
for i=n:-1:1
    X(i)= A(i,n+1);
    for j=i+1:n
        X(i)=X(i)-X(j)*A(i,j);
    end
    X(i)=X(i)/A(i,i);
end

disp('Se ha encontrado el valor de las incognitas: ')
X