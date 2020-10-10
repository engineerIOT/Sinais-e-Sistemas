close all
clear all
 
clc
clear
 
%CONSTANTES%
 
% 1)Definir parametros para plotar a onda dente de serra/rampa 
tr = 2*[-2 -1 -1 0 0 1 1 2 2],...
yr = [0 1 0 1 0 1 0 1 0],...
 
%Período
T= 2; 
 
%Criando comunicacao com o usuario
prompt = 'Usuário favor digitar o numero de harmônicas a serem utilizadas na sintetização do sinal da figura (g): ';
 
%passando o valor de entrada para a variavel
valorDigitado = input(prompt)
 
 
%Número de harmônicas(n)
n=valorDigitado;                         
 
%Valor do limite de tempo
M=3;
 
%Frequencia de amostragem
Fs = 0.001;
 
%Definindo o intervalo de tempo
intervalo = -M:Fs:M;
 
%Valor de ajuste de amplitude da função a ser amostrada
mult = 2; 
 
 
%Inicio do indice 
indice = 1;
      
%Freqüência Fundamental
w=2.0*pi/T;
 
%Inicio do loop
%repassando os parâmetros de intervalo para a variável t 
for t= intervalo
    
    %a variável da Série Exponencial de Fourier da função (g) com valor 0 
    valor = 0.0; 
    
    %a variável k [e limitada pelos valores de k para contemplar os dois lados da descontinuidade
    for k = -n:n 
        
        %tratando exceção para o caso de uma divisão por zero
        if (k ~=0.0) 
            
        %Série Exponencial de Fourier da função (g) calulada no software 
        %WolframAlpha
        valor = valor +( ( (2*i*k*w - exp(2*i*k*w)+1) * (exp(i*k*t*w -2*i*w*k)) ) / (2*(k^2)*w^2)); 
        
        %senão 
        else
            
            %incrementa o valor da função (g)
            valor = valor +1; 
            
        %fim do tratamento da função (g)    
        end
     %fim do repasse dos valores de n para k   
    end
    
    %passando os parâmetros para a variável res seguindo o índice 
    res (indice) = (valor/mult);
    
    %incrementa o valor dda vari[avel índice
    indice = indice +1;
end
%fim do loop
 
%Plotando a série de Fourier Truncada com n aproximações
%Criando a figura 1
figure(1);
 
%Plotando a Série Exponencial de Fourier da função (g) calulada no software 
%em função do intervalo (em vermelho)
plot (intervalo, res,'r');
hold;
 
%Mantém  no mesmo gráfico a próxima plotagem
 
%Plotando o sinal original (traçejado e preto)
plot(tr,yr,'k:'); 
hold;
%titulo para o elemento do eixo x                   
xlabel('time (seconds)');
 
%titulo para o elemento do eixo y                   
ylabel(['x(t) approximation']);
 
%titulo para a figura 1                   
title(['Gráfico da Série Exponencial de Fourier truncada com (n = {',num2str(n),'})']);
 
%definindo os limites dos eixos do gráfico da figura 1
axis ([-M M -0.2 1.2]);
 
%intervalo de tempo por oscilação
t =(0:Fs:T);
 
%Definir função da figura (g) 
x = inline('(t.*(t>=0).*(t<2))','t');
 
%Freqüência de amostragem
Fs = 0.001;
 
%plotar o gráfico
figure(2)
 
%Plotando a função da figura (g) em função do tempo 
%Criando a figura 1
plot(t,x(t))
 
%titulo para o elemento do eixo x                   
xlabel('t(s)');
 
%titulo para o elemento do eixo y                  
ylabel('x(t)');
 
axis ([-1 M -0.2 2.2]);
 
%titulo para a figura 2                   
title(['Gráfico da função da figura (g) (n = {',num2str(n),'})']);
 
%Calcula a integral 
Potencia_g = (4/T)*sum(((x(t)/T).^2)*Fs)/2
 
%Calcula a distorção harmônica 
Dtotal = (Potencia_g/0.5)*100
 
%Potencia_x=(1/T)*sum((x(t).^2*Fs));
 
 
 
%Período de 2 segundos 
T_0 = 2;                               
 
%Como x(t) é contínuoe, Dn                  
%cai lentamente, em função de 1/n².
%Representa aproximadamente 1% da freqüência fundamental (100)= 2^8
N_0 = 256;                             
 
%Período de amostragem                        
T = T_0/N_0;                           
 
%intervalo de amostragem
t = (0:T:T*(N_0-1))'; 
 
%número finito de coeficientes para a aproximação da fft
M=20;                                  
 
%função (g)rampa com t0 =2 
x = (t.*(t>=0).*(t<2));                
 
%Plotando na mesma figura todos os gráficos
figure(3)
 
%Algoritmo para calcular a Transformada rápida de Fourier da função rampa e 
%aproximar o espectro exponencial de Fourier %para -M<=N<=M
D_n = fft(x)/N_0;
 
%valores das amostras como sendo a média dos valores da função nos dois lados %da descontinuidade                     
n = [-N_0/2:N_0/2-1]';
 
%Limpar janela de figura atual
clf;
 
%Linha 1 Coluna 1 da figura 1       
subplot (2,2,1);
 
%Plotando o módulo de D_n em função de n
%usando abs para calcular o módulo de D_n e para calcular a transformada de Fourier usar fftshift para reorganizar deslocando o componente de freqüência zero para o centro da matriz.
stem(n,abs(fftshift(D_n)),'k');        
 
%definindo os limites dos eixos do gráfico da Linha 1 Coluna 1 da figura 1                                                 
axis ([-M M -.1 1.5]);                 
 
%titulo para o elemento do eixo x
xlabel ('n');
 
%titulo para o elemento do eixo y                          
ylabel('|D_n|');                       
 
%Linha 1 Coluna 2 da figura 1      
subplot (2,2,2);                       
%Plotando o angulo de D_n em função de n usando angle para calcular o ângulo e
%usando fftshift para reorganizar deslocando o componente de freqüência zero para o centro da matriz.
stem(n,angle(fftshift(D_n)),'k');
   
%definindo os limites dos eixos do gráfico da Linha 2 Coluna 2 da figura 1
axis ([-M M -3 3]);
 
%titulo para o elemento do eixo x                    
xlabel ('n');
 
%titulo para o elemento do eixo y                          
ylabel('\angle D_n [rad]');            
 
%definindo o intervalodo espectro trigonométrico de Fourier aproximado
n = [0:M];                             
 
%Definindo o coeficiente C_n(1) do espectro trigonométrico de Fourier como %sendo o módulo de D_n da transformada de Fourier X usando fftshift para %reorganizar deslocando o componente de freqüência zero para o centro da %matriz.
C_n(1)= abs(D_n(1));
                   
%Definindo o coeficiente dos  demais C_n do espectro trigonométrico de Fourier %como sendo o módulo de D_n da transformada de Fourier X usando fftshift para %reorganizar deslocando o componente de frequência zero para o centro da %matriz.
C_n(2:M+1) = 2*abs(D_n(2:M+1)); 
 
%usando a função angle para calcular o ângulo repassando o valor de D_n(1) %para theta_n(1)
theta_n(1) = angle (D_n(1));           
 
%usando a função angle para calcular o ângulo repassando o valor de %(D_n(2:M+1)) para theta_n(2:M+1)
theta_n(2:M+1) = angle(D_n(2:M+1));    
 
%Linha 2 Coluna 1 da figura 1
subplot (2,2,3);                       
 
%Plotando os coeficientes trigonométricos de fourier em função de n  
stem(n,C_n,'k');                       
 
%titulo para o elemento do eixo x                   
xlabel('n');
 
%titulo para o elemento do eixo y                           
ylabel('C_n');                         
 
subplot (2,2,4);                       
%Linha 2 Coluna 2 da figura 1
 
%Plotando o ângulo dos coeficientes trigonométricos de fourier em função de n                    
stem(n,theta_n,'k');                
   
%titulo para o elemento do eixo x
xlabel('n');
   
%titulo para o elemento do eixo y                        
ylabel('\theta_n[rad]');  
