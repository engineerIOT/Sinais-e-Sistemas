clear
clc


%x = inline('4.*((t>=0)&(t<1))+2.*((t>=1)&(t<2))','t')
x = inline('(t.*(t>=0).*(t<2))-(t.*(t>=-2).*(t<0))','t')


%intervalo de tempo por oscila��o
t =(-4:0.001:4);
%t2 =(-2:2);

%valor da fun��o com valores definidos por t

%plotar o gr�fico
plot(t,x(t))
xlabel('t');
ylabel('x(t)');
%grid;
