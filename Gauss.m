clc, clear
n= input('¿De cuantas ecuaciones se compone el sistema?: ');

%Reservamos espacio anticipadamente, para optimzar.
M=zeros(n,n); Y= zeros(n,1); X=Y;

%Lectura de la matriz de coeficientes
disp('Lectura de la matriz de coeficientes.')
for i=1:n
    for j=1:n
        fprintf('Ingrese un valor para M(%d, %d): ', i, j)
        M(i, j) = input('');
    end
end
disp('Lectura del vector columna Y')
for i=1:n
    fprintf('Ingrese un valor para Y(%d) ',i)
    Y(i) = input('');
   
end

%Formamos la matriz ampliada
A=[M,Y];

%Eliminacion hacia adelante
for j=1:n-1
    for i=j+1:n
        A(i,:) = A(i,:)+A(j,:)*(-A(i,j)/A(j,j));
    end
end

%Sustitucion hacia atras
for i=n:-1:1
    X(i)= A(i,n+1);
    for j=i+1:n
        X(i)=X(i)-X(j)*A(i,j);
    end
    X(i)=X(i)/A(i,i);
end

disp('Se ha encontrado el valor de las incognitas: ')
X
