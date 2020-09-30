x = inline ('mod (t+pi/2, 2*pi)<=pi');

t= linspace (-3*pi, 3*pi,1000);

sumsterms = zeros (16,length(t));

sumterms(1,:) =1/2;

for n = 1:size(sumterms,1)-1;
    sumterms(n+1,:) = (2/(pi*n)*sin(pi*n/2))*cos(n*t);
end

x_N = cumsum (sumterms);
figure(1);
clf;
ind=0;

for N = [0,1:2:size(sumterms,1)-1], ind = ind+1;
    subplot (3,3,ind);
    plot (t,x_N(N+1,:), 'k',t,x(t),'k--');
    %sub
    axis ([-2*pi 2*pi -0.2 1.2]);
end


