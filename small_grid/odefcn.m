function dydt = odefcn(t,y,u)
% y is a 1*N matrix
%% form a delayed input
input = inp_func(u.input,t, u.delay);
%% initialization
global J_prev
dydt = zeros(size(y,1),1);
% z = y(1:u.num_z);
% x = y(u.num_z+1:2:u.num_x*2+u.num_z);
% j1 = (u.num_x*2+u.num_z+1:u.num_x*3+u.num_z);
% j2 = (u.num_x*3+u.num_z+1:u.num_x*4+u.num_z);
%% calculation
% dx/dt dy/dt
% global sall
s=zeros(1,12);
for i = u.num_z+1:2:u.num_x*2+u.num_z
    s((i-1)/2) = sum(J_prev{(i-1)/2}.*S(y(i),u.theta_x,u.kappa))-u.W1*S(y(1),u.theta_1,u.kappa)-u.W2*S(y(2),u.theta_2,u.kappa);
%     -u.W1*S(y(1),u.theta_1,u.kappa)
% if i == u.num_z+1
%     sall=[sall s];
% end
    dydt(i) = 3.*y(i)-y(i).^3+2-y(i+1)+input((i-1)/2)+s((i-1)/2)+u.rho*randn(1,1);
    dydt(i+1) = u.epsilon.*(u.gamma.*(1+tanh(y(i)./u.beta))-y(i+1));
end
s=reshape(s,u.grid_r,[]);
% dz/dt
sigma_naught = sum(y(u.num_z+1:2:end)>=u.theta_z); %the number of oscillators whose x activities are >= theta_z.
sigma_infty = sigma_naught>0; % =1 if at least one oscillator >= theta_z
dydt(1) = u.phi*(sigma_infty-y(1));
dydt(2) = u.phi*(sigma_naught/u.N_t-y(2));

%<x>
global t_p x_sum
t_p = [t_p t];
x = y(u.num_z+1:2:end);
x_sum = [x_sum x];
TF = t-t_p(1,:)>u.t_th;
t_p(:,TF)=[];
x_sum(:,TF)=[];
h = sum(x_sum,2)./length(x_sum)>u.theta; % h(xi)
% h=y(u.num_z+1:2:end)>u.theta;
J_prev = J(J_prev, reshape(h,u.grid_r,[]), u.W_T, u.eta, u.sigma_t, u.sigma_f);
t
end
function out = inp_func(in,t, delay)
out = in;
end

