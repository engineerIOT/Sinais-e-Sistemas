clear 
clc

%considere a defini��o da sen�ide exponencialmente amortecida 
% Inline function:
%x(t) = exp(-t).*((t>=0)&(t<1)) ou x(t)=e?t(u(t)?u(t ? 1))

x = inline('((t>=0)&(t<1))','t')

%intervalo de tempo por oscila��o
t =(-4:0.01:4);
%t2 =(-2:2);

%valor da fun��o com valores definidos por t

%plotar o gr�fico
plot(t,x(t) +x(t+1))
xlabel('t');
ylabel('x(t)');
grid;