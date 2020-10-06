clc
clear

%CONSTANTES%

% 1)Definir parametros para plotar a onda dente de serra/rampa 
tr = 2*[-2 -1 -1 0 0 1 1 2 2],...
yr = [0 1 0 1 0 1 0 1 0],...

%Per�odo
T= 2; 

%N�mero de harm�nicas(n)
n=50;                         

%Valor do limite de tempo
M=3;

%Frequencia de amostragem
Fs = 0.001;

%Definindo o intervalo de tempo
intervalo = -M:Fs:M;

%Valor de ajuste de amplitude da fun��o a ser amostrada
mult = 2; 


%Inicio do indice 
indice = 1;
      
%Freq��ncia Fundamental
w=2.0*pi/T;

%Inicio do loop
%repassando os par�metros de intervalo para a vari�vel t 
for t= intervalo
    
    %a vari�vel da S�rie Exponencial de Fourier da fun��o (g) com valor 0 
    valor = 0.0; 
    
    %a vari�vel k [e limitada pelos valores de k para contemplar os dois lados da descontinuidade
    for k = -n:n 
        
        %tratando exce��o para o caso de uma divis�o por zero
        if (k ~=0.0) 
            
        %S�rie Exponencial de Fourier da fun��o (g) calulada no software 
        %WolframAlpha
        valor = valor +( ( (2*i*k*w - exp(2*i*k*w)+1) * (exp(i*k*t*w -2*i*w*k)) ) / (2*(k^2)*w^2)); 
        
        %sen�o 
        else
            
            %incrementa o valor da fun��o (g)
            valor = valor +1; 
            
        %fim do tratamento da fun��o (g)    
        end
     %fim do repasse dos valores de n para k   
    end
    
    %passando os par�metros para a vari�vel res seguindo o �ndice 
    res (indice) = (valor/mult);
    
    %incrementa o valor dda vari[avel �ndice
    indice = indice +1;
end
%fim do loop

%Plotando a s�rie de Fourier Truncada com n aproxima��es
%Criando a figura 1
figure(1);

%Plotando a S�rie Exponencial de Fourier da fun��o (g) calulada no software 
%em fun��o do intervalo (em vermelho)
plot (intervalo, res,'r');
hold;

%Mant�m  no mesmo gr�fico a pr�xima plotagem

%Plotando o sinal original (tra�ejado e preto)
plot(tr,yr,'k:'); 
hold;
%titulo para o elemento do eixo x                   
xlabel('time (seconds)');

%titulo para o elemento do eixo y                   
ylabel(['x(t) approximation']);

%titulo para a figura 1                   
title(['Gr�fico da S�rie Exponencial de Fourier truncada com (n = {',num2str(n),'})']);

%definindo os limites dos eixos do gr�fico da figura 1
axis ([-M M -0.2 1.2]);

%intervalo de tempo por oscila��o
t =(-4:Fs:4);

%Definir fun��o da figura (g) 
x = inline('(t.*(t>=0).*(t<2))','t');

%Freq��ncia de amostragem
Fs = 0.001;

%plotar o gr�fico
figure(3)

%Plotando a fun��o da figura (g) em fun��o do tempo 
%Criando a figura 1
plot(t,x(t))

%titulo para o elemento do eixo x                   
xlabel('t(s)');

%titulo para o elemento do eixo y                  
ylabel('x(t)');

axis ([-1 M -0.2 2.2]);

%titulo para a figura 1                   
title(['Gr�fico da fun��o da figura (g) (n = {',num2str(n),'})']);

%Calcula a integral 
Potencia_g = (4/T)*sum((x(t).^2*Fs))

%Calcula a distor��o harm�nica 
Dtotal = (Potencia_g/n)*100
