% Interpolacion cuadratica
% Programacion Numerica
% Jose Luis Romero Vazquez
% 19/05/21

clc, clear
x0=1;
x1=4;
x2=6;
fx0=0;
fx1=1.3862;
fx2=1.7917;

n=input('¿En que punto desea evaluar la funcion?: ');
    b0=fx0;
    b1=(fx1-fx0)/(x1-x0);
    b2=((fx2-fx1)/(x2-x1)-b1)/(x2-x0);
   
     fprintf('\nEl coeficiente en b0 es: %f\n',b0)
     fprintf('El coeficiente en b1 es: %f\n',b1)
     fprintf('El coeficiente en b2 es: %f\n',b2)
     
     disp('La interpolacion es:')
     X = [num2str(b0),' + ',num2str(b1),' * ','(x -',num2str(x0),') ',num2str(b2),' * ','(x -',num2str(x0),') ',' * (x -',num2str(x1),') ']
     X2=(b0+b1.*(n-x0)+b2.*(n-x0).*(n-x1))
     fprintf('\nLa funcion evaluada en el punto elegido: %f\n',X2)
    
x=0:0.1:10;
f=(b0+b1.*(x-x0)+b2.*(x-x0).*(x-x1));
plot (x,f)

text(n,X2,'\leftarrow El punto evaluado en la interpolacion')

grid on;
hold on
f2 = log(x); 
plot (x,f2)
text(5,1.6094,'\leftarrow El punto evaluado en la interpolacion')
