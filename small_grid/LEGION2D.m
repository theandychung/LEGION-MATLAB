clear
% close all
clc
t0 = clock; % just to time the code
%% Define Parameters
theta_a = 0; %for input, 50
tspan = [0 3000];
u.input=[1 1 0 0
         0 0 0 0
         0 0 0 0
         0 0 0 1];

% constants
u.epsilon = .02;
u.gamma = 6.0;
u.beta = 0.1;
u.rho = .02; %amplitude of gaussian noise
u.phi = 3.0; %the rate at which the inhibitor reacts to the stimulation.
u.W1 = 0.1;
u.W2 = 0.1;
u.theta = 0.05; %x is enabled? if x>theta_sp, h(x)=1;else h(x)=0;
u.theta_x = -.2;
u.theta_1 = 0.1;
u.theta_z = 0.1;
u.kappa = 50;
u.t_th = 7; %for <x>
u.num_z = 2;  % global inhibitor
u.eta = 10; %control speed of DJ
u.W_T = 5; %DJ weights
u.sigma_t = 8.0;
u.sigma_f = 5.0;
%% initialization
u.input = (u.input>theta_a)*0.2+(u.input<=theta_a)*-0.02;
[u.grid_r, grid_c] = size(u.input);  % grid width, grid length
u.N_t = grid_c;%total number of the oscillators in a row of the segregation network
u.theta_2 = 1/(2*u.N_t);
rng('default')
u.num_x = grid_c*u.grid_r;
% num_J = u.num_x^2;
global J_prev
J_prev = cell(u.grid_r,grid_c);
for i = 1:u.grid_r
    for j = 1:grid_c
        J_prev{i,j} = zeros(1, 4);
    end
end
oscillator_init = reshape([ones(1,u.num_x);zeros(1,u.num_x)],1,[])*-1; %oscillator start from (x=-1,y=0)
% oscillator_init = zeros(1,u.num_x*2);
inhibitor_init = [0 0];
y0 = [inhibitor_init oscillator_init];

global t_p x_sum
t_p = [];
x_sum = [];%ones(u.grid_r*grid_c,1)*-1;

% global sall
% sall=[];
%% calculation
[t,y] = ode23(@(t,y) odefcn(t,y,u),tspan,y0);

%% total time used
total_min_used = round(etime(clock,t0)/60)

%% saving
filename = [datestr(now,'yyyymmdd_HH_MM_SS') '.mat'];
save(filename,'filename','y','t','tspan','u')

%% draw
run('draw.m')