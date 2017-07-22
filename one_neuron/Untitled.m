
u.input= .5;
u.epsilon=0.2;
u.gamma=6.0;
u.beta=0.1;

u.rho = .02;
tau = 1;
steps = 0.001;total_t = 40
xx=[0];
yy=[0];

for i=1:(total_t/steps-1)
dx = steps*(3.*xx(end)-xx(end).^3+2-yy(end)+u.input);%+u.rho*randn(1,1)
dy= steps*(u.epsilon.*(u.gamma.*(1+tanh(xx(end)./u.beta))-yy(end)));
xx = [xx xx(end)+dx*tau];
yy = [yy yy(end)+dy*tau];
end

delta_t = 4; % window size (sec)
simple = tsmovavg(xx','s',delta_t/steps,1);

t = 1:(total_t/steps);
figure
subplot(1,2,1)
p1 = plot(t,xx,'-',t,yy,'-.',t,simple,'-');
p1(1).LineWidth = 2;
legend('x','y')
xlabel('Time (ms)')
ylabel('Activity')
title('Neuron Activity')

subplot(1,2,2)
x = linspace(-2.5,2.5);
plot(x, 3.*x-x.^3+2+u.input, x, u.gamma*(1+tanh(x/u.beta)))
hold on
p2=plot(xx,yy,'k');
% p2.LineWidth = 2;
p2.Marker = '.';
xlim([-2.5 2.5])
ylim([-2 8])
xlabel('X Activity')
ylabel('Y Activity')
str = ['Phase Plane with \epsilon =' num2str(u.epsilon)];
title(str)
legend('x-nullcline','y-nullcline','Periodic Solution.')