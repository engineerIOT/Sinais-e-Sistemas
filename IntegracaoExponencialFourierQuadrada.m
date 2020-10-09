close all
clear all
 
clc
clear

%Criando comunicacao com o usuario
prompt = 'Usuário favor digitar o numero de harmônicas a serem utilizadas na sintetização do sinal da figura (e): ';
 
%passando o valor de entrada para a variavel
valorDigitado = input(prompt)
 
 
%Número de harmônicas(n)
n=valorDigitado;                         

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
fx = -(teste>=1).*(teste<2)+(teste>=4).*(teste<5)-((teste>=-5).*(teste<-4))+((teste>=-2).*(teste<-1));

%Criando a figura 1
figure(1)

%Plotando a Série Exponencial de Fourier da função (g) calulada no software 
%em função do intervalo (em vermelho)
plot (intervalo, res,'r');

%Mantém  no mesmo gráfico a próxima plotagem
hold;
%Plotando o sinal original (traçejado e preto)
plot(teste,fx,'k:'); 
 
%titulo para o elemento do eixo x                   
xlabel('t(s)');

%titulo para o elemento do eixo y                   
ylabel(['x(t) approximation']);
 
%titulo para a figura 1                   
title(['Gráfico da Série Exponencial de Fourier truncada com (n = {',num2str(n),'})']);
 
%definindo os limites dos eixos do gráfico da figura 1
axis ([-M M -1.2 1.2]);

%Definir função da figura (e) 
x = inline('(-(t>=1).*(t<2))+((t>=-2).*(t<-1))','t');
%x2= inline('((t>=-2).*(t<-1))','t');
%Freqüência de amostragem
Fs = 0.001;

%intervalo de tempo por oscilação
t =(-6/4:Fs:6/4);

%plotar o gráfico
figure(2)

%Plotando a série função da figura (e) em função do tempo 
%Criando a figura 2
plot(t,x(t))

%titulo para o elemento do eixo x                   
xlabel('t(s)');

%titulo para o elemento do eixo y                  
ylabel('x(t)');

%definindo os limites dos eixos do gráfico da figura 2
axis ([-3 3 -1.2 1.2]);

%titulo para a figura 1                   
title(['Gráfico da função da figura (e) (n = {',num2str(n),'})']);
          
xlabel('t(s)');

%titulo para o elemento do eixo y                  
ylabel('x(t)');

%definindo os limites dos eixos do gráfico da figura 2
axis ([-3 3 -1.2 1.2]);

%titulo para a figura 1                   
title(['Gráfico da função da figura (e) (n = {',num2str(n),'})']);

%Calcula a integral 
Potencia_g = (4/T)*sum((x(t).^2*Fs))

%Calcula a distorção harmônica 
Dtotal = ((Potencia_g)/n*n)*100

Px=abs(valor)

%Estabelecendo os parâmetros básicos para plotagem do Espectro Exponencial de Fourier
%Parametros basicos
 
%Período de 2 segundos 
T_0 = 6;
 
%Como x(t) possui descontinuidade, Dn                  
%cai lentamente, em função de 1/n.
%Representa aproximadamente 1% da freqüência fundamental (100)= 2^8
N_0 = 256;
 
%Período de amostragem
T = T_0/N_0;
 
%intervalo de amostragem
t = (0:T:T*(N_0-1))';
 
%número finito de coeficientes para a aproximação da fft
M=20;
 
%funcao(e)
x=(-(t>=1).*(t<2))+((t>=-2).*(t<-1)); 
 
%Plotando na mesma figura todos os gráficos
figure(3)
 
%Algoritmo para calcular a Transformada rápida de Fourier da função rampa e 
%aproximar o espectro exponencial de Fourier %para -M<=N<=M
D_n = fft(x)/N_0;
 
%valores das amostras como sendo a média dos valores da função
%nos dois lados %da descontinuidade                     
n = [-N_0/2:N_0/2-1]';
 
%Limpar janela de figura atual
clf; 
 


%Linha 1 Coluna 1 da figura 
subplot (2,2,1); 
 
%Plotando o módulo de D_n em função de n
%usando abs para calcular o módulo de D_n e para calcular a transformada %de %Fourier usar fftshift para reorganizar deslocando o componente 
%de freqüência zero para o centro da matriz.
stem(n,abs(fftshift(D_n)),'k');
 
%definindo os limites dos eixos do gráfico da Linha 1 Coluna 1 da figura 1                                                 
axis ([-M M 0 0.2]); 
 
%titulo para o elemento do eixo x
xlabel ('n'); 
 
%titulo para o elemento do eixo y                          
ylabel('|D_n|');
 
%Linha 1 Coluna 2 da figura 1      
subplot (2,2,2); 
 
%Plotando o angulo de D_n em função de n usando angle para calcular o 
%ângulo e %usando fftshift para reorganizar deslocando o componente de
%freqüência zero para o centro da matriz.
stem(n,angle(fftshift(D_n)),'k');
 
%definindo os limites dos eixos do gráfico da Linha 2 Coluna 2 da figura 1
axis ([-M M -4 4]);
 
%titulo para o elemento do eixo x                    
xlabel ('n'); 
 
%titulo para o elemento do eixo y                          
ylabel('\angle D_n [rad]');
 
 
%definindo o intervalodo espectro trigonométrico de Fourier aproximado
n = [0:M];
 
%Definindo o coeficiente C_n(1) do espectro trigonométrico de Fourier como 
%sendo o módulo de D_n da transformada de Fourier X usando fftshift para
%reorganizar deslocando o componente de freqüência zero para o centro da
%matriz.
C_n(1)= abs(D_n(1));
 
%Definindo o coeficiente dos  demais C_n do espectro trigonométrico de 
%Fourier %como sendo o módulo de D_n da transformada de Fourier X 
%usando fftshift para %reorganizar deslocando o componente de frequência
%zero para o centro da %matriz.
C_n(2:M+1) = 2*abs(D_n(2:M+1));
 
%usando a função angle para calcular o ângulo repassando o valor de D_n(1)
%para theta_n(1)
theta_n(1) = angle (D_n(1)); 
 
%usando a função angle para calcular o ângulo repassando o valor de 
%(D_n(2:M+1)) para theta_n(2:M+1)
theta_n(2:M+1) = angle(D_n(2:M+1));
 
%Linha 2 Coluna 1 da figura 1
subplot (2,2,3); 
 
%Plotando os coeficientes trigonométricos de fourier em função de n  
stem(n,C_n,'k');
 
%titulo para o elemento do eixo x                   
xlabel('n'); 
 
%titulo para o elemento do eixo y                           
ylabel('C_n');
 
%Linha 2 Coluna 2 da figura 1
subplot (2,2,4);
 
%Plotando o ângulo dos coeficientes trigonométricos de fourier 
%em função de n                    
stem(n,theta_n,'k');
 
%titulo para o elemento do eixo x
xlabel('n'); 
 
%titulo para o elemento do eixo y                        
ylabel('\theta_n[rad]');

