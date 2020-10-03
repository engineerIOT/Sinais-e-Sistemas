close all
clear all

n=256;
M=6
intervalo = -M:0.001:M;
 
indice = 1;
T= 6;
w=2.0*pi/T;
 
for t= intervalo
    valor = 0.0;
    for k = -n:n;
        if (k ~=0.0)
            %termo = (i*(-1+ exp(i*k*w)*( -1+ exp(i*k*w))));
            %termo2= (exp(i*k*w)+ exp(2*i*k*w)+1);
            %termo3= (exp(i*k*(t-2)*w));
            
            %termo = (i*(-1+ exp(i*k*w)));
            %termo2 = exp((i*k*w*(t-2)));
            
            termo = (i*(-1+ exp(i*k*w))*(-1+ exp(i*k*w)));
            termo2= (exp(i*k*w)+ exp(2*i*k*w)+1);
            termo3 = exp((i*k*w*(t-2)));
            
        valor = (valor +( termo*termo2*termo3 )*(-1) / (6*k*w));
        else
            valor = valor +1;
            
        end
    end
    res (indice) = (valor-1);
    indice = indice +1;
end

figure(1)
plot (intervalo, res);

figure(2)
stem (intervalo, abs(res));

figure(3)
stem (intervalo, angle(res));
   

