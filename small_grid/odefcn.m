function dydt = odefcn(t,y)
% y is a 1*N matrix
%% Define Parameters
input==0.11;
eta=0.35;
gamma=3.0;
beta=0.1;

w1 = 0.5;
w2 = 0.5;
global kappa grid_r
kappa = 50;
theta_x = 0.5;
theta_1 = 0.1;
N_t = grid_r;%total number of the oscillators in a row of the segregation network
theta_zx=0.1;
theta = 0.1; %threshold for DJ
phi = 3; %the rate at which the inhibitor reacts to the stimulation.
%% initialization
global num_z J_prev t_prev

dydt = zeros(size(y,1),1);
% z = y(1:num_z);
% x = y(num_z+1:2:num_x*2+num_z);
theta_2 = 1/(2*N_t);
% j1 = (num_x*2+num_z+1:num_x*3+num_z);
% j2 = (num_x*3+num_z+1:num_x*4+num_z);
%% calculation
% dx/dt
for i = num_z+1:2:num_x*2+num_z
    s = reshape(J_prev{(i-1)/2},1,[])*S(y(i),theta_x)-w1*S(y(1),theta_1)-w2*S(y(2),theta_2);
    dydt(i) = 3.*y(i)-y(i).^3+2-y(i+1)+input+s((i-1)/2)+0.5*randn(4,1);
    dydt(i+1) = eta.*(gamma.*(1+tanh(y(i)./beta))-y(i+1));
end
% dz/dt
sigma_naught = sum(y(num_z+1:2:end)>=theta_zx); %the number of oscillators whose x activities are >= theta_z.
sigma_infty = sigma_naught>0; % =1 if at least one oscillator >= theta_z
dydt(1) = phi*(sigma_infty-y(1));
dydt(2) = phi*(sigma_naught/N_t-y(2));

% new J and t
J_prev = J(y(num_z+1:2:end),J_prev,theta);
t_prev = t;

end

