clear
clc

x = inline('(-(t>=1).*(t<2))+((t>=-2).*(t<-1))','t');


Fs=1000;
t=-3:1/Fs:3;

%plotar o gráfico
figure(1)
plot(t,x(t))
xlabel('t');
ylabel('x(t)');
axis ([-3 3 -1.5 1.5]);
%grid;

x1=(-(t>=1).*(t<2))+((t>=-2).*(t<-1));
figure(2)
plot(t,x1)
xlabel('t');
ylabel('x(t)');
axis ([-3 3 -1.5 1.5]);
N=100000; % N points for frequency computation
fx=fftshift(fft(x1,N))/sqrt(N);
fx=fx.*conj(fx);
 % frequency axis
f=(-N/2:N/2-1)*Fs/(2*N);
figure(3);
plot(f,fx);
xlabel('t');
ylabel('x(t)');
axis ([-2 2 0 40]);