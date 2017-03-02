function dydt = odefcn(t,y)
% y is a 1*N matrix

%% initialization
input=[1
0
0];
eta=0.35;
gamma=3.0;
beta=0.1;

wz = 0.5;
global kappa;
kappa = 50;
theta_x = 0.5;
theta_xz = 0.1;
theta_zx=0.1;
w = [
    0 1 0
    1 0 0
    0 0 0
    ]*0.3;%segregated
dydt = zeros(size(y,1),1);
z = y(1:num_z);
x = y(num_z+1:2:num_x*2+num_z);
j1 = (num_x*2+num_z+1:num_x*3+num_z);
j2 = (num_x*3+num_z+1:num_x*4+num_z);
%% calculation
s = w*S(y(3:2:end),theta_x)-wz*S(y(1),theta_xz);
for i = 2:2:size(y,1)
    
    dydt(i) = 3.*y(i)-y(i).^3+2-y(i+1)+input+s(i/2)+0.5*randn(4,1);
    dydt(i+1) = eta.*(gamma.*(1+tanh(y(i)./beta))-y(i+1));
end
dydt(1) = 3*((sum(y(2:2:end)>theta_zx)>0)-y(1));
end

