close all
clear all
 
clc
clear
 
%Criando comunicacao com o usuario
prompt = 'Usu�rio favor digitar o numero de harm�nicas a serem utilizadas na sintetiza��o do sinal da figura (e): ';
 
%passando o valor de entrada para a variavel
valorDigitado = input(prompt)
 
 
%N�mero de harm�nicas(n)
n=valorDigitado;                         
 
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
    
    %a vari�vel da S�rie Exponencial de Fourier da fun��o (e) com valor 0 
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
          
        %fim do tratamento da fun��o (e)    
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
fx = -(teste>=1).*(teste<2)+(teste>=4).*(teste<5)-((teste>=-5).*(teste<-4))+((teste>=-2).*(teste<-1));
 
%Criando a figura 1
figure(1)
 
%Plotando a S�rie Exponencial de Fourier da fun��o (e) calulada no software 
%em fun��o do intervalo (em vermelho)
plot (intervalo, res,'r');
 
%Mant�m  no mesmo gr�fico a pr�xima plotagem
hold;
%Plotando o sinal original (tra�ejado e preto)
plot(teste,fx,'k:'); 
 
%titulo para o elemento do eixo x                   
xlabel('t(s)');
 
%titulo para o elemento do eixo y                   
ylabel(['x(t) approximation']);
 
%titulo para a figura 1                   
title(['Gr�fico da S�rie Exponencial de Fourier truncada com (n = {',num2str(n),'})']);
 
%definindo os limites dos eixos do gr�fico da figura 1
axis ([-M M -1.2 1.2]);
 
%Definir fun��o da figura (e) 
x = inline('(-(t>=1).*(t<2))+((t>=-2).*(t<-1))','t');

%Freq��ncia de amostragem
Fs = 0.001;
 
%intervalo de tempo por oscila��o
t =(-6/4:Fs:6/4);
 
%plotar o gr�fico
figure(2)
 
%Plotando a s�rie fun��o da figura (e) em fun��o do tempo 
%Criando a figura 2
plot(t,x(t))
 
%titulo para o elemento do eixo x                   
xlabel('t(s)');
 
%titulo para o elemento do eixo y                  
ylabel('x(t)');
 
%definindo os limites dos eixos do gr�fico da figura 2
axis ([-3 3 -1.2 1.2]);
 
%titulo para a figura 2                   
title(['Gr�fico da fun��o da figura (e) (n = {',num2str(n),'})']);
          
xlabel('t(s)');
 
%titulo para o elemento do eixo y                  
ylabel('x(t)');
 
%titulo para a figura 2                   
title(['Gr�fico da fun��o da figura (e) (n = {',num2str(n),'})']);
 
%Calcula a integral 
Potencia_g = (4/T)*sum((x(t).^2*Fs))
 
%Calcula a distor��o harm�nica 
Dtotal = ((Potencia_g)/n*n)*100
 
%Px=abs(valor)
 
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
figure(3)
 
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
%usando abs para calcular o m�dulo de D_n e para calcular a transformada %de %Fourier usar fftshift para reorganizar deslocando o componente 
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
