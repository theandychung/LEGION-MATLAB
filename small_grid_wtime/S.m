function s= S(x,theta,kappa)
% S(x,theta,kappa)
% supress input x approach to 0 if it is not larger than theta
s=1./(1+exp(-kappa.*(x-theta)));
end

