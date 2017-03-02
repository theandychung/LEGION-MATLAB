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
global num_x num_J num_z J_prev
grid_w = 3;  % grid width
grid_l = 3;  % grid length
num_z = 2;
num_x = grid_l*grid_w;
num_J = num_x^2;
tol_channels = num_z + num_x*2 + num_J;
J_prev = 
y0= zeros(1,tol_channels);
%% draw
[t,y] = ode45(@(t,y) odefcn(t,y),tspan,y0);
figure
subplot(1,2,1)
plot(t,y(:,2),'-',t,y(:,3),'-.')
subplot(1,2,2)
plot(y(:,2),y(:,3))
suptitle('1st Oscillator')