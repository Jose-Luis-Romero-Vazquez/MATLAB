% Diferenciacion numerica
% Programacion Numerica
% Jose Luis Romero Vazquez
% 14/04/21

%Esta es la ecuacion que se propone para el ejercicio, pero el programa se
%hizo pensando para cualquier funcion propuesta por el usuario
%(-0.1.*x^4)-(0.15.*x^3)-(0.5.*x^2)-(0.25.*x)+1.2


clear
clc
format shortG

f=input('Ingrese la funcion:', 's');
x2=input('Ingrese el punto xi: ');
x4=input('Ingrese el incremento: ')

x1=(x2-x4)
x3=(x2+x4)
xA=0
xB=0
xC=0

ezplot(f)
%Activa la grafica de la funcion
grid on
f=inline(f);

    xA=(((f(x3))-(f(x2)))/(x4));
    xB=(((f(x2))-(f(x1)))/(x4));
    xC=(((f(x3))-(f(x1)))/(2*(x4)));
    
    E2=(abs((-0.9125-xA)/(-0.9125)))*100;
    E3=(abs((-0.9125-xB)/(-0.9125)))*100;
    E4=(abs((-0.9125-xC)/(-0.9125)))*100;
    
    fprintf('   Derivada:       Error:  ')
    
     disp ([xA,  E2])
     %Diferenciacion hacia adelante
     disp ([xB,  E3])
     %Diferenciacion hacia atras
     disp ([xC,  E4])
     %Diferenciacion central
    
x=-6:0.01:10
f1=(-0.1.*x.^4)-(0.15.*x.^3)-(0.5.*x.^2)-(0.25.*x)+1.2
plot (x,f1)
hold on
f2=-0.9125*x + 1.38125
plot (x,f2)