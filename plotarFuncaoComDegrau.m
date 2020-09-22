
clear 
clc

%considere a defini��o da sen�ide exponencialmente amortecida 
%f(t)=e^(?t)*cos(2*pi*t)
g = inline('exp(-t).*cos(2*pi*t).*(t>=0)','t')

%intervalo de tempo fornecendo 100 pontos por oscila��o
%a utiliza��o de 20 a 200 pontos por oscila��o geralmente � adequada
t =(-8:0.01:8);
%t2 =(-2:2);

%valor da fun��o com valores definidos por t
g(t)

%plotar o gr�fico
plot(t,g(t))
%plot(t,g(2*t+1)+g(-t+1))
xlabel('t');
ylabel('g(t)');
grid;