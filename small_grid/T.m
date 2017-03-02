function W_permanent = T( xi_f, xi_t, xj_f, xj_t )
% Permanent Weights
% sigma_t & sigma_f determine the widths of the Gaussian distribution along
% the time axis and the frequency axis, respectively.
% (ti,fi) and (tj, fj) are the two-dimensional indices of the oscillator xi
% and xj, respectively.
% disp('permanent')
sigma_t = 1;
sigma_f = 1;
W_permanent = exp(-(xj_t-xi_t)^2/sigma_t^2+(xj_f-xi_f)^2/sigma_f^2);

end

