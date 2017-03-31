clear
close all
clc
t0 = clock; % just to time the code
%% Define Parameters
theta_a = 0; %for input, 50
tspan = [0 4000];
u.input=[1 0 0 0 1
         0 0 0 0 1
         0 0 0 0 1];
u.delay = 1;%for future

% constants
u.epsilon=.04;
u.gamma=9.0;
u.beta=0.1;
u.rho = .02; %amplitude of gaussian noise
u.phi = 3.0; %the rate at which the inhibitor reacts to the stimulation.
u.W1 = 1.5;
u.W2 = 1.0;
u.theta = 0.05; %x is enabled? if x>theta_sp, h(x)=1;else h(x)=0;
u.theta_x = -0.5;
u.theta_1 = 0.5;
u.theta_z = 0.1;
u.kappa = 50;
u.t_th = 14; %for <x>
u.num_z = 2;  % global inhibitor
u.eta = 10; %control speed of DJ
u.W_T = 6; %DJ weights
u.sigma_t = 8.0;
u.sigma_f = 5.0;
%% initialization
u.input = (u.input>theta_a)*0.2+(u.input<=theta_a)*-0.02;
u.grid_r = size(u.input,1);  % grid width
grid_c = size(u.input,2);  % grid length
u.N_t = u.grid_r;%total number of the oscillators in a row of the segregation network
u.theta_2 = 1/(2*u.N_t);
% u = reshape(input,1,[]);
rng('default')
u.num_x = grid_c*u.grid_r;
% num_J = u.num_x^2;
% tol_channels = u.num_z + u.num_x*2 + num_J;
tol_channels = u.num_z + u.num_x*2;
global J_prev
J_prev = cell(u.grid_r,grid_c);
for i = 1:u.grid_r
    for j = 1:grid_c
        J_prev{i,j} = zeros(u.grid_r, grid_c);
    end
end
y0 = reshape([0 ones(1,(tol_channels-2)/2);0 zeros(1,(tol_channels-2)/2)],1,[])*-1;%oscillator start from (x=1,y=0)

global t_p x_sum
t_p = [];
x_sum = [];%ones(u.grid_r*grid_c,1)*-1;
%% calculation
[t,y] = ode23(@(t,y) odefcn(t,y,u),tspan,y0);

%% total time used
total_min_used = round(etime(clock,t0)/60)

%% saving
filename = [datestr(now,'yyyymmdd_HH_MM_SS') '.mat'];
save(filename,'filename','y','t','tspan','u')

%% draw
run('draw.m')