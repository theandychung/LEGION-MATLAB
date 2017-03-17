clear
close all
clc
%% Define Parameters
% input=0.11;
% eta=0.35;
% gamma=2.1;
% beta=0.1;
input=[1 1 0 0
    0 0 0 0
    0 0 0 0
    0 0 1 1];
tspan = [0 90];
%% initialization
global grid_r grid_c
grid_r = size(input,1);  % grid width
grid_c = size(input,2);  % grid length
u = reshape(input,1,[]);
rng('default')
global num_x num_z J_prev
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

global t_p x_sum
t_th = 14;
t_p = 0;
x_sum = zeros(grid_r*grid_c,1);
%% draw


[t,y] = ode23(@(t,y) odefcn(t,y,u,t_th),tspan,y0);

filename = [datestr(now,'yyyymmdd_HH_MM_SS') '.mat'];
save(filename,'y','t','tspan','t_th','input')

figure
subplot(1,2,1)
plot(t,y(:,3),'-',t,y(:,4),'-.')
xlim(tspan)
subplot(1,2,2)
plot(y(:,3),y(:,4))
% suptitle(filename)
suptitle('1st Oscillator')
xlim([-2.5,2])


figure
subplot(4,1,1)
plot(t,y(:,1),'b-',t,y(:,2),'r-')
title('Global Inhibitor Activity')
subplot(4,1,2)
plot(t,y(:,3),t,y(:,5),t,y(:,7))
title('1st Channel X Activity')
subplot(4,1,3)
plot(t,y(:,9),t,y(:,11),t,y(:,13))
title('2nd Channel X Activity')
subplot(4,1,4)
plot(t,y(:,15),t,y(:,17),t,y(:,19))
title('3rd Channel X Activity')
% suptitle(filename)
