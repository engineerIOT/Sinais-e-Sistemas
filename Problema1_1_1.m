clear 
clc

x = inline('((x1).^2) +((x2).^2)','t')
x1 =1
x2 =-1

%intervalo de tempo por oscilação
t =(0:0.001:2);

%E_x = quad(x,0,100)