T_0 = 6;
N_0 = 256;
T = T_0/N_0;

t = (0:T:T*(N_0-1))';
M=20;

x=(-(t>=1).*(t<2))+((t>=-2).*(t<-1));

figure(1)
D_n = fft(x)/N_0; n = [-N_0/2:N_0/2-1]'
clf; subplot (2,2,1); stem(n,abs(fftshift(D_n)),'k');
axis ([-M M -.1 1.5]); xlabel ('n'); ylabel('|D_n|');
subplot (2,2,2);  stem(n,angle(fftshift(D_n)),'k');
axis ([-M M -3 3]);  xlabel ('n'); ylabel('\angle D_n [rad]');


n = [0:M]; C_n(1)= abs(D_n(1)); C_n(2:M+1) = 2*abs(D_n(2:M+1));
theta_n(1) = angle (D_n(1)); theta_n(2:M+1) = angle(D_n(2:M+1));
subplot (2,2,3); stem(n,C_n,'k');
xlabel('n'); ylabel('C_n');
subplot (2,2,4); stem(n,theta_n,'k');
xlabel('n'); ylabel('\theta_n[rad]');

figure(2)
plot(t,x)
xlabel('g'); ylabel('x(t)');