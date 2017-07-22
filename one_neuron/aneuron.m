clear;clc
% close all
% which ode to choose
% https://www.mathworks.com/help/matlab/math/choose-an-ode-solver.html#bu13kwa
% 
% u.input= 1;
% u.epsilon=0.02;
% u.gamma=6.0;
% u.beta=0.1;
u.input= 0;
u.epsilon=0.2;
u.gamma=9.0;
u.beta=0.1;


u.rho = .02;

% u.epsilon = .02;
% u.gamma = 6.0;
% u.beta = 0.1;
% u.rho = .02; %amplitude of gaussian noise


tspan = [0 3000];

% y0=[-1 0];
y0=[0 0];
[t,y] = ode23(@(t,y) odefcn(t,y,u),tspan,y0);

figure
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
ylim([-2 15])
xlabel('X Activity')
ylabel('Y Activity')
% str = ['Phase Plane with \epsilon =' num2str(u.epsilon)];
str = 'Phase Plane';
title(str)
legend('x-nullcline','y-nullcline','Periodic Solution.')

% 
% figure
% x = linspace(-2.5,2.5);
% plot(x, 3.*x-x.^3+2+u.input, x, u.gamma*(1+tanh(x/u.beta)))
% hold on
% p2=plot(y(:,1),y(:,2));
% p2.LineWidth = 2;
% p2.Marker = '*';
% xlim([-2.5 2.5])
% ylim([-2 15])
% xlabel('X Activity')
% ylabel('Y Activity')
% str = ['Phase Plane with \epsilon =' num2str(u.epsilon)];
% title(str)
% legend('x-nullcline','y-nullcline','Periodic Solution.')
% legend('x-nullcline','y-nullcline')