close all
clear all
 
clc
clear

%N�mero de harm�nicas(n)
n=50;

%Valor do limite de tempo
M=6;

%Definindo o intervalo de tempo
intervalo = -M:0.001:M;

%Freq��ncia de amostragem
Fs = 0.001;

%Inicio do indice 
indice = 1;

%Per�odo de 6 segundos para a figura (e)
T= 6;

%Freq��ncia Fundamental
w=2.0*pi/T;
 
%Inicio do loop
%repassando os par�metros de intervalo para a vari�vel t 
for t= intervalo
    
    %a vari�vel da S�rie Exponencial de Fourier da fun��o (g) com valor 0 
     valor = 0.0;
     
         %a vari�vel k [e limitada pelos valores de k para contemplar os 
         %dois lados da descontinuidade
     for k = -n:n;
      
        %tratando exce��o para o caso de uma divis�o por zero
        if (k ~=0.0)
            
      %S�rie Exponencial de Fourier da fun��o (g) calulada no software 
      %WolframAlpha
           termo = (i*(-1+ exp(i*k*w))*(-1+ exp(i*k*w)));
           termo2= (exp(i*k*w)+ exp(2*i*k*w)+1);
           termo3 = exp((i*k*w*(t-2)));
           valor = (valor +( termo*termo2*termo3 )*(-1) / (6*k*w));
        
        %sen�o 
        else
            
            %incrementa o valor da fun��o (e)
            valor = valor +1;
          
        %fim do tratamento da fun��o (g)    
        end
        
    %fim do repasse dos valores de n para k   
     end
    
    %passando os par�metros para a vari�vel res seguindo o �ndice 
    res (indice) = (valor-1);
    
    %incrementa o valor dda vari[avel �ndice
    indice = indice +1;
    
%fim do loop    
end

%Plotando a s�rie de Fourier Truncada com n aproxima��es
%Definindo o intervalo de tempo para a fun;�o da figura (e)
teste=-M:0.001:M;

%Criando o sinal original (tra�ejado e preto) da figura (e)
x = -(teste>=1).*(teste<2)+(teste>=4).*(teste<5)-((teste>=-5).*(teste<-4))+((teste>=-2).*(teste<-1));

%Criando a figura 1
figure(1)

%Plotando a S�rie Exponencial de Fourier da fun��o (g) calulada no software 
%em fun��o do intervalo (em vermelho)
plot (intervalo, res,'r');

%Mant�m  no mesmo gr�fico a pr�xima plotagem
hold;
%Plotando o sinal original (tra�ejado e preto)
plot(teste,x,'k:'); 
 
%titulo para o elemento do eixo x                   
xlabel('t');


%titulo para o elemento do eixo y                   
ylabel(['x(t) approximation']);
 
%titulo para a figura 1                   
title(['Gr�fico da S�rie Exponencial de Fourier truncada com (n = {',num2str(n),'})']);
 
%definindo os limites dos eixos do gr�fico da figura 1
axis ([-M M -1.2 1.2]);

%grid;



