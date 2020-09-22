clear 
clc

%considere a definição da senóide exponencialmente amortecida 
% Inline function:
%x(t) = exp(-t).*((t>=0)&(t<1)) ou x(t)=e?t(u(t)?u(t ? 1))

x = inline('exp(-2*t).*(cos(2*pi*t).^2).*(t>=0)','t')

%intervalo de tempo por oscilação
t =(0:0.001:100);
%t =(-2:2);

%valor da função com valores definidos por t
%x(t)
E_x = quad(x,0,100)
E_x2 = sum (x(t)*0.001)


