close all
clear all
 
clc
clear

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
figure(1)

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
%usando abs para calcular o módulo de D_n e para calcular a transformada de
%Fourier usar fftshift para reorganizar deslocando o componente 
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
