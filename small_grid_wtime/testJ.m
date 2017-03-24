clc
v=[1 0 0 0 0
       0 1 0 0 0];
t = 1.5;
vq = interp1(v,t)
figure
plot((1:5),v,'o-',t,vq,'*');
legend('v','vq');