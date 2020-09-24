Fs=10;
t=-3:1/Fs:3;
x=((t>=0).*(t<2))
plot(t,x)
N=1000; % N points for frequency computation
fx=fftshift(fft(x,N))/sqrt(N);
fx=fx.*conj(fx);
 % frequency axis
f=(-N/2:N/2-1)*Fs/(2*N);
figure; plot(f,fx);