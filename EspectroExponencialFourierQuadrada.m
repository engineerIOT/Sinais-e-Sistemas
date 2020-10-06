close all
clear all
 
clc
clear

%Estabelecendo os par�metros b�sicos para plotagem do Espectro Exponencial de Fourier
%Parametros basicos

%Per�odo de 2 segundos 
T_0 = 6;

%Como x(t) possui descontinuidade, Dn                  
%cai lentamente, em fun��o de 1/n.
%Representa aproximadamente 1% da freq��ncia fundamental (100)= 2^8
N_0 = 256;

%Per�odo de amostragem
T = T_0/N_0;

%intervalo de amostragem
t = (0:T:T*(N_0-1))';

%n�mero finito de coeficientes para a aproxima��o da fft
M=20;

%funcao(e)
x=(-(t>=1).*(t<2))+((t>=-2).*(t<-1)); 

%Plotando na mesma figura todos os gr�ficos
figure(1)

%Algoritmo para calcular a Transformada r�pida de Fourier da fun��o rampa e 
%aproximar o espectro exponencial de Fourier %para -M<=N<=M
D_n = fft(x)/N_0;

%valores das amostras como sendo a m�dia dos valores da fun��o
%nos dois lados %da descontinuidade                     
n = [-N_0/2:N_0/2-1]';

%Limpar janela de figura atual
clf; 

%Linha 1 Coluna 1 da figura 
subplot (2,2,1); 

%Plotando o m�dulo de D_n em fun��o de n
%usando abs para calcular o m�dulo de D_n e para calcular a transformada de
%Fourier usar fftshift para reorganizar deslocando o componente 
%de freq��ncia zero para o centro da matriz.
stem(n,abs(fftshift(D_n)),'k');

%definindo os limites dos eixos do gr�fico da Linha 1 Coluna 1 da figura 1                                                 
axis ([-M M 0 0.2]); 

%titulo para o elemento do eixo x
xlabel ('n'); 

%titulo para o elemento do eixo y                          
ylabel('|D_n|');

%Linha 1 Coluna 2 da figura 1      
subplot (2,2,2); 

%Plotando o angulo de D_n em fun��o de n usando angle para calcular o 
%�ngulo e %usando fftshift para reorganizar deslocando o componente de
%freq��ncia zero para o centro da matriz.
stem(n,angle(fftshift(D_n)),'k');

%definindo os limites dos eixos do gr�fico da Linha 2 Coluna 2 da figura 1
axis ([-M M -4 4]);

%titulo para o elemento do eixo x                    
xlabel ('n'); 

%titulo para o elemento do eixo y                          
ylabel('\angle D_n [rad]');


%definindo o intervalodo espectro trigonom�trico de Fourier aproximado
n = [0:M];

%Definindo o coeficiente C_n(1) do espectro trigonom�trico de Fourier como 
%sendo o m�dulo de D_n da transformada de Fourier X usando fftshift para
%reorganizar deslocando o componente de freq��ncia zero para o centro da
%matriz.
C_n(1)= abs(D_n(1));

%Definindo o coeficiente dos  demais C_n do espectro trigonom�trico de 
%Fourier %como sendo o m�dulo de D_n da transformada de Fourier X 
%usando fftshift para %reorganizar deslocando o componente de frequ�ncia
%zero para o centro da %matriz.
C_n(2:M+1) = 2*abs(D_n(2:M+1));

%usando a fun��o angle para calcular o �ngulo repassando o valor de D_n(1)
%para theta_n(1)
theta_n(1) = angle (D_n(1)); 

%usando a fun��o angle para calcular o �ngulo repassando o valor de 
%(D_n(2:M+1)) para theta_n(2:M+1)
theta_n(2:M+1) = angle(D_n(2:M+1));

%Linha 2 Coluna 1 da figura 1
subplot (2,2,3); 

%Plotando os coeficientes trigonom�tricos de fourier em fun��o de n  
stem(n,C_n,'k');

%titulo para o elemento do eixo x                   
xlabel('n'); 

%titulo para o elemento do eixo y                           
ylabel('C_n');

%Linha 2 Coluna 2 da figura 1
subplot (2,2,4);

%Plotando o �ngulo dos coeficientes trigonom�tricos de fourier 
%em fun��o de n                    
stem(n,theta_n,'k');

%titulo para o elemento do eixo x
xlabel('n'); 

%titulo para o elemento do eixo y                        
ylabel('\theta_n[rad]');
