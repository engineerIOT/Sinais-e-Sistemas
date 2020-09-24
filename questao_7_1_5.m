clear 
clc

%considere a definição da senóide exponencialmente amortecida 
% Inline function:
%x(t) = exp(-t).*((t>=0)&(t<1)) ou x(t)=e?t(u(t)?u(t ? 1))



Fs=100;
t=-3:1/Fs:3;
x = 4.*((t>=0)&(t<1))+2.*((t>=1)&(t<2))


plot(t,x)
N=1000; % N points for frequency computation
fx=fftshift(fft(x,N))/sqrt(N);
fx=fx.*conj(fx);
 % frequency axis
f=(-N/2:N/2-1)*Fs/(2*N);
figure; plot(f,fx);

