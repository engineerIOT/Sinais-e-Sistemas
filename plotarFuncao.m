
clear 
clc

%considere a definição da senóide exponencialmente amortecida 
%f(t)=e^(?t)*cos(2*pi*t)
f = inline('exp(-t).*cos(2*pi*t)','t')

%intervalo de tempo fornecendo 100 pontos por oscilação
%a utilização de 20 a 200 pontos por oscilação geralmente é adequada
t =(-2:0.01:2);
%t2 =(-2:2);

%valor da função com valores definidos por t
f(t)

%plotar o gráfico
plot(t,f(t))
xlabel('t');
ylabel('f(t)');
grid;

