clear
clc


%x = inline('4.*((t>=0)&(t<1))+2.*((t>=1)&(t<2))','t')
x = inline('(t.*(t>=0).*(t<2))-(t.*(t>=-2).*(t<0))','t')


%intervalo de tempo por oscilação
t =(-4:0.001:4);
%t2 =(-2:2);

%valor da função com valores definidos por t

%plotar o gráfico
plot(t,x(t))
xlabel('t');
ylabel('x(t)');
%grid;
