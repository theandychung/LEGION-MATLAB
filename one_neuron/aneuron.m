clear;close all;clc
% which ode to choose
% https://www.mathworks.com/help/matlab/math/choose-an-ode-solver.html#bu13kwa
% 
u.input=0;
u.epsilon=.02;
u.gamma=6.0;
u.beta=0.1;
tspan = [0 900];

y0=[0 0];
[t,y] = ode45(@(t,y) odefcn(t,y,u),tspan,y0);
% figure
subplot(1,2,1)
p1 = plot(t,y(:,1),'-',t,y(:,2),'-.');
p1(1).LineWidth = 2;
legend('x','y')
xlabel('Time')
ylabel('Activity')
title('Neuron Activity')

subplot(1,2,2)
x = linspace(-2.5,2.5);
plot(x, 3.*x-x.^3+2+u.input, x, u.gamma*(1+tanh(x/u.beta)))
hold on
p2=plot(y(:,1),y(:,2));
% p2.LineWidth = 2;
p2.Marker = '*';
xlim([-2.5 2.5])
ylim([-2 8])
xlabel('X Activity')
ylabel('Y Activity')
title('Phase Plane')
legend('x-nullcline','y-nullcline','Periodic Solution.')