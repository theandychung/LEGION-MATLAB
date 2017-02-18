clear;close all;clc
% which ode to choose
% https://www.mathworks.com/help/matlab/math/choose-an-ode-solver.html#bu13kwa
% 
input=0.11;
eta=0.35;
gamma=2.1;
beta=0.1;


tspan = [0 100];
y0=[0 0];
[t,y] = ode45(@(t,y) odefcn(t,y,eta,gamma,beta,input),tspan,y0);
figure
subplot(1,2,1)
plot(t,y(:,1),'-',t,y(:,2),'-.')
legend('x','y')
subplot(1,2,2)
plot(y(:,1),y(:,2))