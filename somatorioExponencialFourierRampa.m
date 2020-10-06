clc
clear

%CONSTANTES%

% 1)Definir parametros para plotar a onda dente de serra/rampa 
tr = 2*[-2 -1 -1 0 0 1 1 2 2],...
yr = [0 1 0 1 0 1 0 1 0],...

%Período
T= 2; 

%Número de harmônicas(n)
n=50;                         

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
t =(-4:Fs:4);

%Definir função da figura (g) 
x = inline('(t.*(t>=0).*(t<2))','t');

%Freqüência de amostragem
Fs = 0.001;

%plotar o gráfico
figure(3)

%Plotando a função da figura (g) em função do tempo 
%Criando a figura 1
plot(t,x(t))

%titulo para o elemento do eixo x                   
xlabel('t(s)');

%titulo para o elemento do eixo y                  
ylabel('x(t)');

axis ([-1 M -0.2 2.2]);

%titulo para a figura 1                   
title(['Gráfico da função da figura (g) (n = {',num2str(n),'})']);

%Calcula a integral 
Potencia_g = (4/T)*sum((x(t).^2*Fs))

%Calcula a distorção harmônica 
Dtotal = (Potencia_g/n)*100
