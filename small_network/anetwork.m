clear
% close all
clc
%% initialization
rng('default') 
% input=0.11;
% eta=0.35;
% gamma=2.1;
% beta=0.1;
		
tspan = [0 200];
y0=[0 0 0 0 0 0 0 0 0];
%% draw
[t,y] = ode45(@(t,y) odefcn(t,y),tspan,y0);
figure
subplot(1,2,1)
plot(t,y(:,2),'-',t,y(:,3),'-.')
subplot(1,2,2)
plot(y(:,2),y(:,3))
suptitle('1st Oscillator')
figure

total_subplots=(size(y,2)-1)/2+1;
subplot(total_subplots,1,1)
plot(t,y(:,1))
title('Global Inhibitor')
for i=1:total_subplots-1
subplot(total_subplots,1,i+1)
plot(t,y(:,i*2))
title(sprintf('Oscillator %d', i))
grid on
end
