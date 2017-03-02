function s= S(x,theta)
global kappa;
s=1./(1+exp(-kappa.*(x-theta)));
end

