% 
% Filename: EspectroFourierRampa.m
%
% Description: Example to show how the truncated Fourier series in 
%              complex exponential form approximates the real 
%              signal.  More and more terms are taken showing a
%              better and better representation of the original signal.
% 

clc;
clear;                   % clear all variables  
close all
clf;                     % clear all figures

%Define multiplicador
mult =2;
limiteTempo= 1;

% Define parameters to plot original sawtooth
tr = mult*[-2 -1 -1 0 0 1 1 2 2],...
yr = [0 1 0 1 0 1 0 1 0],...



% Plot Truncated Fourier Series Approximation (N = 1)

N = 1;                   % define number of terms to use (n = -N..N)
c0 = 0.5;                % define dc bias coefficient
t = mult*(-limiteTempo:0.001:limiteTempo);          % define time values for y(t)
y = c0 * ones(size(t));  % let initial y = c0 (dc bias) for all times
wo=2;

for n = -N:-1,           % compute y for negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;
                         % compute y for positive n and add to y
for n = 1:N,             % found using negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;

subplot(3,3,1);          % plot approximation
%figure(1)
plot(mult*t,y); 
hold;
%figure(2)
plot(tr,yr,':'); 
hold;
xlabel('time (seconds)');
ylabel('x(t) approximation');
title('Truncated FS, for N= 1');
axis ([-4 4 -0.2 1.2]);


N = 2;                   % define number of terms to use (n = -N..N)
c0 = 0.5;                % define dc bias coefficient
t = mult*(-1:0.001:1);          % define time values for y(t)
y = c0 * ones(size(t));  % let initial y = c0 (dc bias) for all times

for n = -N:-1,           % compute y for negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;
                         % compute y for positive n and add to y
for n = 1:N,             % found using negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;


subplot(3,3,2);          % plot approximation
%figure(1)
plot(mult*t,y); 
hold;
%figure(2)
plot(tr,yr,':'); 
hold;
xlabel('time (seconds)');
ylabel('x(t) approximation');
title('Truncated FS, for N= 2');
axis ([-4 4 -0.2 1.2]);

N = 3;                   % define number of terms to use (n = -N..N)
c0 = 0.5;                % define dc bias coefficient
t = mult*(-1:0.001:1);          % define time values for y(t)
y = c0 * ones(size(t));  % let initial y = c0 (dc bias) for all times

for n = -N:-1,           % compute y for negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;
                         % compute y for positive n and add to y
for n = 1:N,             % found using negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;


subplot(3,3,3);          % plot approximation
%figure(1)
plot(mult*t,y); 
hold;
%figure(2)
plot(tr,yr,':'); 
hold;
xlabel('time (seconds)');
ylabel('x(t) approximation');
title('Truncated FS, for N= 3');
axis ([-4 4 -0.2 1.2]);

N = 4;                   % define number of terms to use (n = -N..N)
c0 = 0.5;                % define dc bias coefficient
t = mult*(-1:0.001:1);          % define time values for y(t)
y = c0 * ones(size(t));  % let initial y = c0 (dc bias) for all times

for n = -N:-1,           % compute y for negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;
                         % compute y for positive n and add to y
for n = 1:N,             % found using negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;


subplot(3,3,4);          % plot approximation
%figure(1)
plot(mult*t,y); 
hold;
%figure(2)
plot(tr,yr,':'); 
hold;
xlabel('time (seconds)');
ylabel('x(t) approximation');
title('Truncated FS, for N= 4');
axis ([-4 4 -0.2 1.2]);

N = 5;                   % define number of terms to use (n = -N..N)
c0 = 0.5;                % define dc bias coefficient
t = mult*(-1:0.001:1);          % define time values for y(t)
y = c0 * ones(size(t));  % let initial y = c0 (dc bias) for all times

for n = -N:-1,           % compute y for negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;
                         % compute y for positive n and add to y
for n = 1:N,             % found using negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;


subplot(3,3,5);          % plot approximation
%figure(1)
plot(mult*t,y); 
hold;
%figure(2)
plot(tr,yr,':'); 
hold;
xlabel('time (seconds)');
ylabel('x(t) approximation');
title('Truncated FS, for N= 5');
axis ([-4 4 -0.2 1.2]);

N = 6;                   % define number of terms to use (n = -N..N)
c0 = 0.5;                % define dc bias coefficient
t = mult*(-1:0.001:1);          % define time values for y(t)
y = c0 * ones(size(t));  % let initial y = c0 (dc bias) for all times

for n = -N:-1,           % compute y for negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;
                         % compute y for positive n and add to y
for n = 1:N,             % found using negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;


subplot(3,3,6);          % plot approximation
%figure(1)
plot(mult*t,y); 
hold;
%figure(2)
plot(tr,yr,':'); 
hold;
xlabel('time (seconds)');
ylabel('x(t) approximation');
title('Truncated FS, for N= 6');
axis ([-4 4 -0.2 1.2]);

N = 7;                   % define number of terms to use (n = -N..N)
c0 = 0.5;                % define dc bias coefficient
t = mult*(-1:0.001:1);          % define time values for y(t)
y = c0 * ones(size(t));  % let initial y = c0 (dc bias) for all times

for n = -N:-1,           % compute y for negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;
                         % compute y for positive n and add to y
for n = 1:N,             % found using negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;


subplot(3,3,7);          % plot approximation
%figure(1)
plot(mult*t,y); 
hold;
%figure(2)
plot(tr,yr,':'); 
hold;
xlabel('time (seconds)');
ylabel('x(t) approximation');
title('Truncated FS, for N= 7');
axis ([-4 4 -0.2 1.2]);

N = 8;                   % define number of terms to use (n = -N..N)
c0 = 0.5;                % define dc bias coefficient
t = mult*(-1:0.001:1);          % define time values for y(t)
y = c0 * ones(size(t));  % let initial y = c0 (dc bias) for all times

for n = -N:-1,           % compute y for negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;
                         % compute y for positive n and add to y
for n = 1:N,             % found using negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;


subplot(3,3,8);          % plot approximation
%figure(1)
plot(mult*t,y); 
hold;
%figure(2)
plot(tr,yr,':'); 
hold;
xlabel('time (seconds)');
ylabel('x(t) approximation');
title('Truncated FS, for N= 8');
axis ([-4 4 -0.2 1.2]);

N = 80;                   % define number of terms to use (n = -N..N)
c0 = 0.5;                % define dc bias coefficient
t = mult*(-1:0.001:1);          % define time values for y(t)
y = c0 * ones(size(t));  % let initial y = c0 (dc bias) for all times

for n = -N:-1,           % compute y for negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;
                         % compute y for positive n and add to y
for n = 1:N,             % found using negative n
  cn = exp(j*pi/2)/(2*pi*n);
  y = y + real(cn * exp(j*n*2*pi*t));
end;


subplot(3,3,9);          % plot approximation
%figure(1)
plot(mult*t,y); 
hold;
%figure(2)
plot(tr,yr,':'); 
hold;
xlabel('time (seconds)');
ylabel('x(t) approximation');
title('Truncated FS, for N= 80');
axis ([-4 4 -0.2 1.2]);

% Draw the amplitude spectrum from exponential Fourier Series
figure(2);                         % put next plots on figure 2
stem(0,c0);                        % plot c0 at nwo = 0
hold;
for n = -N:2:N,                    % loop over series index n
   cn = exp(j*pi/2)/(2*pi*n);                % Fourier Series Coefficient
  stem(n*wo,abs(cn))               % plot |cn| vs nwo
end
for n = -N+1:2:N-1,                % loop over even series index n 
  cn = 0;                          % Fourier Series Coefficient
  stem(n*wo,abs(cn));              % plot |cn| vs nwo
end

xlabel('w (rad/s)')
ylabel('|cn|')
ttle = ['Amplitude Spectrum with N = ',num2str(N)];
title(ttle); 
grid;
hold;


% Draw the phase spectrum from exponential Fourier Series

figure(3);
stem(0,angle(c0)*180/pi);          % plot angle of c0 at nwo = 0

hold;
for n = -N:2:N,                    % loop over odd series index n 
  cn = exp(j*pi/2)/(2*pi*n);                % Fourier Series Coefficient
  stem(n*wo,angle(cn)*180/pi);     % plot |cn| vs nwo
end
for n = -N+1:2:N-1,                % loop over even series index n 
  cn = 0;                          % Fourier Series Coefficient
  stem(n*wo,angle(cn)*180/pi);     % plot |cn| vs nwo
end

xlabel('w (rad/s)')
ylabel('angle(cn) (degrees)')
ttle = ['Phase Spectrum with N = ',num2str(N)];
title(ttle);
grid;
hold;


L = length(t);      % Signal length

rampa = (t.*(t>=0).*(t<1))

figure(4)
plot(t,rampa)
title('Ramp in Time Domain')
xlabel('Time (t)')
ylabel('X(t)')
axis ([-4 4 -0.2 1.2]);
next = 2^nextpow2(L);
Y = fft(rampa,next);

f = 100*(0:(next/2))/next;
P = abs(Y/next).^2;
figure(5)
plot(f,P(1:next/2+1)) 
title('Sawtooth in Frequency Domain')
xlabel('Frequency (f)')
ylabel('|P(f)|^2')