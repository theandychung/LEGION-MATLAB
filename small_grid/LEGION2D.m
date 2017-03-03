clear
% close all
clc
%% Define Parameters
% input=0.11;
% eta=0.35;
% gamma=2.1;
% beta=0.1;

tspan = [0 50];
global grid_r
grid_r = 3;  % grid width
grid_c = 3;  % grid length
%% initialization
rng('default') 
global num_x num_z J_prev t_prev
t_prev = 0;
num_z = 2;  % global inhibitor
num_x = grid_c*grid_r;
% num_J = num_x^2;
% tol_channels = num_z + num_x*2 + num_J;
tol_channels = num_z + num_x*2;
J_prev = cell(grid_r,grid_c);
for i = 1:grid_r
    for j = 1:grid_c
        J_prev{i,j} = zeros(grid_r, grid_c);
    end
end
y0= zeros(1,tol_channels);
%% draw
[t,y] = ode45(@(t,y) odefcn(t,y),tspan,y0);
figure
subplot(1,2,1)
plot(t,y(:,3),'-',t,y(:,4),'-.')
xlim(tspan)
subplot(1,2,2)
plot(y(:,3),y(:,4))
suptitle('1st Oscillator')
xlim([-2.5,2])

figure
subplot(4,1,1)
plot(t,y(:,1),'b-',t,y(:,2),'r-')
title('Global Inhibitor Activity')
subplot(4,1,2)
plot(t,y(:,3),t,y(:,5),t,y(:,7))
title('1st-3rd X Activity')
subplot(4,1,3)
plot(t,y(:,9),t,y(:,11),t,y(:,13))
title('4th-6th X Activity')
subplot(4,1,4)
plot(t,y(:,15),t,y(:,17),t,y(:,19))
title('7th-9th X Activity')