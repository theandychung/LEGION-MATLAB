function dydt = odefcn(t,y,eta,gamma,beta,input,w)
dydt = zeros(2,1);
dydt(1) = 3.*y(1)-y(1).^3+2-y(2)+input;
dydt(2) = eta.*(gamma.*(1+tanh(y(1)./beta))-y(2));
end

