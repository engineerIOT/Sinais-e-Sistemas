    
N=50
%define the angular frequency
    w=(2*pi)/6;
    
    %define the time for calculate the fourier seriers coefficients
    t=-10:0.001:10;
    
    %define the expression (it is little bit tricky)
    x1(t>-2&t<-1) = 1;
    x2(t<2&t>1)   =-1;

    % preenchimento de zero para equalização de comprimento

    x11=[x1,zeros(1,length(t)-length(x1))];
    x22=[x2,zeros(1,length(t)-length(x2))];
    x=x11+x22;
 
    %fourier series for first 25
    for k=1:1:N
        A(k)=(trapz(t,x.*exp(-1i*w*k*t)))/6;
    end
    
    k= 1:1:N;
    
    %for  ploting fourier series representation.
    f=0;
    for p=1:1:100
        cp= 1i*(cos(p*w)-cos(2*p*w))/(p*w);% p-th harmonics.
        f=f+(cp*(exp(1i*w*p*t)));%add harmonics
    end
    
    figure(1)
    plot(t,x);
    axis([-4,4,-2,2]);
    grid on;
    
    figure(2)
    stem(k,abs(A));
    grid on;
    
      figure(3)
    stem(k,angle(A));
    grid on;
   x = inline('(-(t>=1).*(t<2))+((t>=-2).*(t<-1))','t');
    figure(4)
    plot(t,f,t,x(t));
    grid on;

    

 x = inline('(-(t>=1).*(t<2))+((t>=-2).*(t<-1))','t');
 
 
Fs=1000;

 
%plotar o gráfico
figure(5)
plot(t,f/1.5,t,x(t))
xlabel('t');
ylabel('x(t)');
axis ([-3 3 -2 2]);
%grid;

