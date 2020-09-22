
clear 
clc

%considere a defini��o da sen�ide exponencialmente amortecida 
%f(t)=e^(?t)*cos(2*pi*t)
f = inline('exp(-t).*cos(2*pi*t)','t')

%intervalo de tempo fornecendo 100 pontos por oscila��o
%a utiliza��o de 20 a 200 pontos por oscila��o geralmente � adequada
t =(-2:0.01:2);
%t2 =(-2:2);

%valor da fun��o com valores definidos por t
f(t)

%plotar o gr�fico
plot(t,f(t))
xlabel('t');
ylabel('f(t)');
grid;

