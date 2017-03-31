function dydt = odefcn(t,y,u)
dydt = zeros(2,1);
dydt(1) = 3.*y(1)-y(1).^3+2-y(2)+u.input;
dydt(2) = u.epsilon.*(u.gamma.*(1+tanh(y(1)./u.beta))-y(2));
end

