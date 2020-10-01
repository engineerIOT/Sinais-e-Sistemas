clc
clear
 
n=25;
 
intervalo = -10:0.01:10;
 
indice = 1;
T= 2;
w=2.0*pi/T;
 
for t= intervalo
    valor = 0.0;
    for k = -n:n
        if (k ~=0.0)
        valor = valor +( ( (2*i*k*w - exp(2*i*k*w)+1) * (exp(i*k*t*w -2*i*w*k)) ) / (2*(k^2)*w^2));
        else
            valor = valor +1;
            
        end
    end
    res (indice) = (valor/1.9);
    indice = indice +1;
end

figure(1)
plot (intervalo, res);

figure(2)
stem(intervalo,abs(res));

figure(3)
stem(intervalo,angle(res));
