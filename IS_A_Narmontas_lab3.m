%A. Narmontas
%Lab 3

clear all
close all


x = 0.1:1/22:1;

d = (1 + 0.6*sin(2*pi*x/0.7)) + 0.3*sin(2*pi*x)/2;

t = tiledlayout('flow');
nexttile
plot(x,d,'r*');
grid on;
xlabel('x');
ylabel('y');
title('Pradinis');

c1 = 0.17;
c2 = 0.9;
sigma1 = 0.25;
sigma2 = 0.22;

Phi1 = exp(-(((x-c1).^2)/(2*(sigma1.^2))));
Phi2 = exp(-(((x-c2).^2)/(2*(sigma2.^2))));

nexttile
plot(x,Phi1,'r*',x,Phi2,'b*');
grid on;
xlabel('x');
ylabel('y');
title('Phi reiksmes');
legend('Phi1', 'Phi2')

w1 = randn(1); 
w2 = randn(1); 
b = randn(1); 
mok_zing = 0.8;

for indx=1:10000
    for n = 1:20
        y = Phi1(n) * w1 + Phi2(n) * w2 + b;
        e = d(n) - y;
        w1 = w1 + mok_zing*e*Phi1(n);
        w2 = w2 + mok_zing*e*Phi2(n);
        b = b + mok_zing*e;
    end    
end
disp(indx)
disp(e)

for n = 1:20
    y2(n) = Phi1(n) * w1 + Phi2(n) * w2 + b;
end 

nexttile([2 2])
plot(x,d,'r*',x,y2,'b');
grid on;
xlabel('x');
ylabel('y');
title('su rastais svoriais apskaiciuota');
legend('Pradinis', 'Apskaiciuotas')


