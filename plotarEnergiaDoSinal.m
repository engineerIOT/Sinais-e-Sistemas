clear 
clc

%considere a definição da senóide exponencialmente amortecida 
% Inline function:
%x(t) = exp(-t).*((t>=0)&(t<1)) ou x(t)=e?t(u(t)?u(t ? 1))

x = inline('exp(-2t).*((t>=0)&(t<1))','t')

%intervalo de tempo por oscilação
t =(0:0.01:1);
%t2 =(-2:2);

%valor da função com valores definidos por t
x(t)
E_x = sum(x(t).*x(t)*0.01)
%plotar o gráfico
plot(t,x(t))
xlabel('t');
ylabel('x(t)');
grid;
