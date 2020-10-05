clc
clear

%CONSTANTES%

% 1)Definir parametros para plotar a onda dente de serra/rampa 
%Define parameters to plot original sawtooth
tr = 2*[-2 -1 -1 0 0 1 1 2 2],...
yr = [0 1 0 1 0 1 0 1 0],...



%O gráfico da série truncada é muito próximo da função x(t) quando N aumenta e espera-se que a série convirja exatamente para x(t) quando N??
%Para N grande, a série exibe um comportamento oscilatório eum sobre-sinal aproximadamente de 9% na proximidade da descontinuidade no pico mais próximo da oscila-ção.
%Independentemente do valor de N, o sobre-sinal permanece em aproximadamente 9%
%Josiah Willard Gibbs, um matemático físico eminen-te, inventor da análise vetorial, forneceu uma explicação matemática para esse comportamento (agora chama-do de fenômeno Gibbs).
%Podemos reconciliar a aparente aberração do comportamento da série de Fourier 
%a freqüência de oscilação do sinal sintetizado é N f0, tal que a largura do pico com sobre-sinal de 9% é aproxi-madamente 1/2N f0. 
%Quando aumentamos N, a freqüência de oscilação aumenta e a largura 1/2N f0do pico dimi-nui. 
%Quando N??, a potência do erro ?0 porque o erro é constituído principalmente de picos, com larguras?0. 
%Portanto, quando N??, a série de Fourier correspondente difere de x(t) por aproximadamente 9% ime-diatamente à esquerda e à direita do ponto de descontinuidade e, 
%mesmo assim, a potência do erro ?0. A razãopara essa confusão é que, neste caso, a série de Fourier converge para a média. 
%Quando isso acontece, tudo o queprometemos é que a energia do erro (em um período) ?0 quando N??. 
%Portanto, a série pode diferir de x(t)em alguns pontos e mesmo assim ter a potência do sinal de erro igual a zero, como verificado anteriormente. 
%No-te que a série, neste caso, também converge no ponto em todos os pontos exceto nos pontos de descontinuidade.
%É precisamente nas descontinuidades que a série difere de x(t) por 9%.
%Quando utilizamos apenas os primeiros N termos da série de Fourier para sintetizar um sinal, 
%estamos ter-minando bruscamente a série, dando um peso unitário para as primeiras N harmônicas e peso zero para todasas harmônicas restantes após N. 
%Esse truncamento abrupto da série causa o fenômeno Gibbs na síntese de funções descontínuas. A Seção 7.8 oferece uma discussão mais detalhada do fenômeno Gibbs, suas ramificaçõese sua solução
%O fenômeno Gibbs está presente apenas quando existe um salto de descontinuidade em x(t). 
%Quando a função contínua x(t) é sintetizada usando apenas os primeiros N termos da série de Fourier, a função sintetizada aproxima-se de x(t) para todo t quando N??. 
%Nenhum fenômeno Gibbs estará presente. Esse fato pode servisto na Fig. 6.9, a qual mostra um ciclo de um sinal periódico contínuo sintetizado com suas primeiras 19 harmônicas.

T= 2;                        %Período
n=9;                       %Número de harmônicas(n)             
M=3;                         %Valor do limite de tempo      
Fs = 0.001;                  %Frequencia de amostragem
intervalo = -M:Fs:M;         %Definindo o intervalo de tempo
mult = 2;                    %Valor de ajuste de amplitude da função a ser amostrada
indice = 1;                  %Inicio do indice       

w=2.0*pi/T;            %Freqüência Fundamental

for t= intervalo
    valor = 0.0;
    for k = -n:n
        if (k ~=0.0)
        valor = valor +( ( (2*i*k*w - exp(2*i*k*w)+1) * (exp(i*k*t*w -2*i*w*k)) ) / (2*(k^2)*w^2)); %Série Exponencial de Fourier da função (g)
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




