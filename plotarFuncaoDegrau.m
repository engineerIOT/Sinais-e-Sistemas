clear 
clc

%considere a definição da senóide exponencialmente amortecida 
%f(t)=e^(?t)*cos(2*pi*t)
g = inline('0.89.*(t>=0)','t')

%intervalo de tempo fornecendo 100 pontos por oscilação
%a utilização de 20 a 200 pontos por oscilação geralmente é adequada
t =(-2:0.01:2);
%t2 =(-2:2);

%valor da função com valores definidos por t
g(t)

%plotar o gráfico
plot(t,g(t))
xlabel('t');
ylabel('g(t)');
grid;
