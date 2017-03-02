clear
% close all
clc
%% Define Parameters
% input=0.11;
% eta=0.35;
% gamma=2.1;
% beta=0.1;

tspan = [0 200];
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
plot(t,y(:,2),'-',t,y(:,3),'-.')
subplot(1,2,2)
plot(y(:,2),y(:,3))
suptitle('1st Oscillator')