function p=interpolacionlagrange(x,f,a)
x=[5 7 13];
x=[3090 3940 4755];

n=length(x);
%syms t;
%p=0;
%plot(x,f,'*')
%grid on;
for i=1:n
    L=1;
    for j=1:n
        if i==j
            L=L*(t-x(j))/(x(i)-x(j));
        end
    end
    p=p+L*f(i);
end
p=expand(p)
hold on;
ezlot(p,[0,10])
t=a;
p=eval(p)