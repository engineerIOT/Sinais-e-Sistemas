close all
clear all
 
clc
clear

%Número de harmônicas(n)
n=50;

%Valor do limite de tempo
M=6;

%Definindo o intervalo de tempo
intervalo = -M:0.001:M;

%Freqüência de amostragem
Fs = 0.001;

%Inicio do indice 
indice = 1;

%Período de 6 segundos para a figura (e)
T= 6;

%Freqüência Fundamental
w=2.0*pi/T;
 
%Inicio do loop
%repassando os parâmetros de intervalo para a variável t 
for t= intervalo
    
    %a variável da Série Exponencial de Fourier da função (g) com valor 0 
     valor = 0.0;
     
         %a variável k [e limitada pelos valores de k para contemplar os 
         %dois lados da descontinuidade
     for k = -n:n;
      
        %tratando exceção para o caso de uma divisão por zero
        if (k ~=0.0)
            
      %Série Exponencial de Fourier da função (g) calulada no software 
      %WolframAlpha
           termo = (i*(-1+ exp(i*k*w))*(-1+ exp(i*k*w)));
           termo2= (exp(i*k*w)+ exp(2*i*k*w)+1);
           termo3 = exp((i*k*w*(t-2)));
           valor = (valor +( termo*termo2*termo3 )*(-1) / (6*k*w));
        
        %senão 
        else
            
            %incrementa o valor da função (e)
            valor = valor +1;
          
        %fim do tratamento da função (g)    
        end
        
    %fim do repasse dos valores de n para k   
     end
    
    %passando os parâmetros para a variável res seguindo o índice 
    res (indice) = (valor-1);
    
    %incrementa o valor dda vari[avel índice
    indice = indice +1;
    
%fim do loop    
end

%Plotando a série de Fourier Truncada com n aproximações
%Definindo o intervalo de tempo para a fun;áo da figura (e)
teste=-M:0.001:M;

%Criando o sinal original (traçejado e preto) da figura (e)
x = -(teste>=1).*(teste<2)+(teste>=4).*(teste<5)-((teste>=-5).*(teste<-4))+((teste>=-2).*(teste<-1));

%Criando a figura 1
figure(1)

%Plotando a Série Exponencial de Fourier da função (g) calulada no software 
%em função do intervalo (em vermelho)
plot (intervalo, res,'r');

%Mantém  no mesmo gráfico a próxima plotagem
hold;
%Plotando o sinal original (traçejado e preto)
plot(teste,x,'k:'); 
 
%titulo para o elemento do eixo x                   
xlabel('t');


%titulo para o elemento do eixo y                   
ylabel(['x(t) approximation']);
 
%titulo para a figura 1                   
title(['Gráfico da Série Exponencial de Fourier truncada com (n = {',num2str(n),'})']);
 
%definindo os limites dos eixos do gráfico da figura 1
axis ([-M M -1.2 1.2]);

%grid;



