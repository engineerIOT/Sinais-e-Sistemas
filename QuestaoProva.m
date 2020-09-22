clear 
clc

%considere a definição da senóide exponencialmente amortecida 
% Inline function:
%x(t) = exp(-t).*((t>=0)&(t<1)) ou x(t)=e?t(u(t)?u(t ? 1))

%x = inline('1.*(t>-3/2)&(t<3/2)','t')
g=4*t +4;
%intervalo de tempo por oscilação
t =(-3:0.001:3);
%t =(-2:2);

%valor da função com valores definidos por t
%x(t)

%plotar o gráfico
plot(t,x(t)*g(t))
%plot(t,g(2*t+1)+g(-t+1))
xlabel('t');
ylabel('g(t)');
grid;
