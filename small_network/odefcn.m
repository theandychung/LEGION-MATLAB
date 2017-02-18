function dydt = odefcn(t,y)

input=0.11;
eta=0.35;
gamma=3.0;
beta=0.1;

% eta=0.35;
% beta=0.1;
% gamma=3.0;
% input=0.11;

wz = 0.5;
global kappa;
kappa = 50;
theta_x = 0.5;
theta_xz = 0.1;
theta_zx=0.1;
w = [
    0 1 0 0
    1 0 0 0
    0 0 0 0
    0 0 0 0
    ]*0.3;%segregated

tol_neurons=(size(y,1)-1)/2;
dydt = zeros(size(y,1),1);

s = w*S(y(2:2:end),theta_x)-wz*S(y(1),theta_xz)+0.5*randn(4,1);
for i = 2:2:size(y,1)
    dydt(i) = 3.*y(i)-y(i).^3+2-y(i+1)+input+s(i/2);
    dydt(i+1) = eta.*(gamma.*(1+tanh(y(i)./beta))-y(i+1));
end
dydt(1) = 3*((sum(y(2:2:end)>theta_zx)>0)-y(1));
end

