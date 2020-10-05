clc
clear

%CONSTANTES%

% 1)Definir parametros para plotar a onda dente de serra/rampa 
%Define parameters to plot original sawtooth
tr = 2*[-2 -1 -1 0 0 1 1 2 2],...
yr = [0 1 0 1 0 1 0 1 0],...



%O gr�fico da s�rie truncada � muito pr�ximo da fun��o x(t) quando N aumenta e espera-se que a s�rie convirja exatamente para x(t) quando N??
%Para N grande, a s�rie exibe um comportamento oscilat�rio eum sobre-sinal aproximadamente de 9% na proximidade da descontinuidade no pico mais pr�ximo da oscila-��o.
%Independentemente do valor de N, o sobre-sinal permanece em aproximadamente 9%
%Josiah Willard Gibbs, um matem�tico f�sico eminen-te, inventor da an�lise vetorial, forneceu uma explica��o matem�tica para esse comportamento (agora chama-do de fen�meno Gibbs).
%Podemos reconciliar a aparente aberra��o do comportamento da s�rie de Fourier 
%a freq��ncia de oscila��o do sinal sintetizado � N f0, tal que a largura do pico com sobre-sinal de 9% � aproxi-madamente 1/2N f0. 
%Quando aumentamos N, a freq��ncia de oscila��o aumenta e a largura 1/2N f0do pico dimi-nui. 
%Quando N??, a pot�ncia do erro ?0 porque o erro � constitu�do principalmente de picos, com larguras?0. 
%Portanto, quando N??, a s�rie de Fourier correspondente difere de x(t) por aproximadamente 9% ime-diatamente � esquerda e � direita do ponto de descontinuidade e, 
%mesmo assim, a pot�ncia do erro ?0. A raz�opara essa confus�o � que, neste caso, a s�rie de Fourier converge para a m�dia. 
%Quando isso acontece, tudo o queprometemos � que a energia do erro (em um per�odo) ?0 quando N??. 
%Portanto, a s�rie pode diferir de x(t)em alguns pontos e mesmo assim ter a pot�ncia do sinal de erro igual a zero, como verificado anteriormente. 
%No-te que a s�rie, neste caso, tamb�m converge no ponto em todos os pontos exceto nos pontos de descontinuidade.
%� precisamente nas descontinuidades que a s�rie difere de x(t) por 9%.
%Quando utilizamos apenas os primeiros N termos da s�rie de Fourier para sintetizar um sinal, 
%estamos ter-minando bruscamente a s�rie, dando um peso unit�rio para as primeiras N harm�nicas e peso zero para todasas harm�nicas restantes ap�s N. 
%Esse truncamento abrupto da s�rie causa o fen�meno Gibbs na s�ntese de fun��es descont�nuas. A Se��o 7.8 oferece uma discuss�o mais detalhada do fen�meno Gibbs, suas ramifica��ese sua solu��o
%O fen�meno Gibbs est� presente apenas quando existe um salto de descontinuidade em x(t). 
%Quando a fun��o cont�nua x(t) � sintetizada usando apenas os primeiros N termos da s�rie de Fourier, a fun��o sintetizada aproxima-se de x(t) para todo t quando N??. 
%Nenhum fen�meno Gibbs estar� presente. Esse fato pode servisto na Fig. 6.9, a qual mostra um ciclo de um sinal peri�dico cont�nuo sintetizado com suas primeiras 19 harm�nicas.

T= 2;                        %Per�odo
n=9;                       %N�mero de harm�nicas(n)             
M=3;                         %Valor do limite de tempo      
Fs = 0.001;                  %Frequencia de amostragem
intervalo = -M:Fs:M;         %Definindo o intervalo de tempo
mult = 2;                    %Valor de ajuste de amplitude da fun��o a ser amostrada
indice = 1;                  %Inicio do indice       

w=2.0*pi/T;            %Freq��ncia Fundamental

for t= intervalo
    valor = 0.0;
    for k = -n:n
        if (k ~=0.0)
        valor = valor +( ( (2*i*k*w - exp(2*i*k*w)+1) * (exp(i*k*t*w -2*i*w*k)) ) / (2*(k^2)*w^2)); %S�rie Exponencial de Fourier da fun��o (g)
        else
            valor = valor +1;
            
        end
    end
    res (indice) = (valor/mult);
    indice = indice +1;
end




% Plot Truncated Fourier Series Approximation (n = 255)
%subplot(3,3,1);          % plot approximation
figure(1);
plot (intervalo, res,'r');
hold;
% Define parameters to plot original sawtooth
plot(tr,yr,'k:'); 
hold;
xlabel('time (seconds)');
ylabel(['x(t) approximation']);
title(['Plot Truncated Fourier Series Approximation (n = {',num2str(n),'})']);
axis ([-M M -0.2 1.2]);
%Os gr�ficos mostram que o comportamento peculiar na s�ntese da fun��o dente-de-serra �
%inerente ao comportamento da s�rie de fourier, devido a converg�ncia n�o
%uniforme nos pontos de descontinuidade. 

%Quando o n�mero de termos (n) � aumentado, o sobre-sinal permanece apenas
%na proximidade do salto de descontinuidade. Para a fun��o (g),
%aumentando-se (n), diminui-se o sobre-sinal pr�ximo a borda de subida, mas
%n�o pr�ximo a borda de descida. O salo de descontinuidade que causa o
%efeito de Gibbs. Um sinal continuo, n�o importa, qu�o r�pido seja sua
%subida, sempre pode ser representado pela s�rie de Fourier em qualquer
%ponto, dentro de um pequeno erro, quando se aumenta (n). Isso n�o � o caso
%quando um verdadeiro salto de descontinuidade est� presente.




