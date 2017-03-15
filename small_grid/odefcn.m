function dydt = odefcn(t,y,u,t_th)
% y is a 1*N matrix
%% Define Parameters
input=0.11;
epsilon=0.35;
gamma=3.0;
beta=0.1;
w1 = 0.5;
w2 = 0.5;
global kappa grid_r
kappa = 50;
theta_x = 0.5;
theta_1 = 0.1;
N_t = grid_r;%total number of the oscillators in a row of the segregation network
theta_z=0.1;
theta = 0.1; %threshold for DJ
phi = 3; %the rate at which the inhibitor reacts to the stimulation.
rho = 0.5; %amplitude of gaussian noise
%% initialization
global num_z J_prev num_x
dydt = zeros(size(y,1),1);
% z = y(1:num_z);
% x = y(num_z+1:2:num_x*2+num_z);
theta_2 = 1/(2*N_t);
% j1 = (num_x*2+num_z+1:num_x*3+num_z);
% j2 = (num_x*3+num_z+1:num_x*4+num_z);
%% calculation
% dx/dt

for i = num_z+1:2:num_x*2+num_z
    s = sum(reshape(J_prev{(i-1)/2},1,[])*S(y(i),theta_x))-w1*S(y(1),theta_1)-w2*S(y(2),theta_2);
    dydt(i) = 3.*y(i)-y(i).^3+2-y(i+1)+input+s+rho*randn(1,1);
    dydt(i+1) = epsilon.*(gamma.*(1+tanh(y(i)./beta))-y(i+1));
end
% dz/dt
sigma_naught = sum(y(num_z+1:2:end)>=theta_z); %the number of oscillators whose x activities are >= theta_z.
sigma_infty = sigma_naught>0; % =1 if at least one oscillator >= theta_z
dydt(1) = phi*(sigma_infty-y(1));
dydt(2) = phi*(sigma_naught/N_t-y(2));

% new J and t
%if the first oscillator's y activity is less than 0.5 and
% t_p is less than a certain value, make the count as the new temperol 
% average's time
global t_p x_sum
t_p = [t_p t];
x = y(num_z+1:2:end);
x_sum = [x_sum x];
TF = t-t_p(1,:)>t_th;
t_p(:,TF)=[];
x_sum(:,TF)=[];

h = sum(x_sum,2)./length(x_sum)>theta; % h(xi)
J_prev = J(reshape(x,grid_r,[]),J_prev, reshape(h,grid_r,[]));
t
end

