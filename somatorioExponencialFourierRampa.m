clc
clear

%CONSTANTES%

% 1)Definir parametros para plotar a onda dente de serra/rampa 
tr = 2*[-2 -1 -1 0 0 1 1 2 2],...
yr = [0 1 0 1 0 1 0 1 0],...

%Período
T= 2; 

%Número de harmônicas(n)
n=9;                         

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

%Mantém  no mesmo gráfico a próxima plotagem
hold;
%Plotando o sinal original (traçejado e preto)
plot(tr,yr,'k:'); 

%titulo para o elemento do eixo x                   
xlabel('time (seconds)');

%titulo para o elemento do eixo y                   
ylabel(['x(t) approximation']);

%titulo para a figura 1                   
title(['Gráfico da Série Exponencial de Fourier truncada com (n = {',num2str(n),'})']);

%definindo os limites dos eixos do gráfico da figura 1
axis ([-M M -0.2 1.2]);

%Os gráficos mostram que o comportamento peculiar na síntese da função dente-de-serra é
%inerente ao comportamento da série de fourier, devido a convergência não
%uniforme nos pontos de descontinuidade. 

%Quando o número de termos (n) é aumentado, o sobre-sinal permanece apenas
%na proximidade do salto de descontinuidade. Para a função (g),
%aumentando-se (n), diminui-se o sobre-sinal próximo a borda de subida, mas
%não próximo a borda de descida. O salo de descontinuidade que causa o
%efeito de Gibbs. Um sinal continuo, não importa, quão rápido seja sua
%subida, sempre pode ser representado pela série de Fourier em qualquer
%ponto, dentro de um pequeno erro, quando se aumenta (n). Isso não é o caso
%quando um verdadeiro salto de descontinuidade está presente.