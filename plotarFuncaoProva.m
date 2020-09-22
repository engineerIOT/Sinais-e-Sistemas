clear 
clc

%considere a definição da senóide exponencialmente amortecida 
% Inline function:
%x(t) = exp(-t).*((t>=0)&(t<1)) ou x(t)=e?t(u(t)?u(t ? 1))

x = inline('((t>=0)&(t<1))','t')

%intervalo de tempo por oscilação
t =(-4:0.01:4);
%t2 =(-2:2);

%valor da função com valores definidos por t

%plotar o gráfico
plot(t,x(t) +x(t+1))
xlabel('t');
ylabel('x(t)');
grid;