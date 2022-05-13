%Metodo de Gauss Jordan - Marcos Cervantes

fi=input('Ingresa la cantidad de filas: ');  %Se le pedira al usuario que ingrese como estara conformada la matriz (Filas y columnas)
co=input('Ingresa la cantidad de columnas: ');

for i=1:co    %Guardamos la matriz de la misma manera que en el ejemplo de gauss simple, de uns forma de matriz aumentada
    for j=1:fi
        fprintf('Fila: %x\n', j)
        fprintf('Columna: %x', i)
        r= input ('Numero de fila y columna: ');
        a(j,i)=r;
        j=j+1;
    end
    i=i+1;
end
a
pause
for i=1:co-1      %Transforma la diagonal superior e inferior en ceros y la diagonal principal en 1
    a(i,:)=a(i,:)/a(i,i);
    for j=i+1:fi
    a(j,:)=a(j,:)-a(i,:)*a(j,i);
    j=j+1;
    a
    pause
    end
  i=i+1;
  a
  pause

end 
for i=fi:-1:2
  for j=i-1:-1:1
    a(j,:)=a(j,:)-a(i,:)*a(j,i);
    j=j-1;
    a
    pause
  end
  i=i-1;
  a
  pause
end
fprintf('resultado\n');