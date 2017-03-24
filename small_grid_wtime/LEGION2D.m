clear
close all
clc
t0 = clock;
%% Define Parameters
% input=0.11;
% eta=0.35;
% gamma=2.1;
% beta=0.1;
delay = 20;
input=[0 0 1 
       0 0 0 
       0 0 0];
tspan = [0 delay*size(input,2)*2];
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


%% calculation
[t,y] = ode23(@(t,y) odefcn(t,y,u,t_th, delay),tspan,y0);
total_min_used = round(etime(clock,t0)/60)
%% save
filename = datestr(now,'yyyymmdd_HH_MM_SS');
save([filename '.mat'],'y','t','tspan','t_th','input')
%% draw
run('draw.m')