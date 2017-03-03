function J_new = J( x, J_old, theta, t_passed)
%Dynamic Connection Weights

%% dummy proof 
if(size(x)~=size(J_old))
    return
end
%% initialization
W_T = 1;
eta = 1;
theta = 0;
c = .00000000001;

[xR,xC] = size(x);
J_new=cell(xR,xC);
Jtemp=cell(xR,xC);
for i = 1:xR
    for j = 1:xC
        J_new{i,j} = zeros(xR, xC);
        Jtemp{i,j} = zeros(xR, xC);
    end
end

%%
for xi_f = 1:xR
    for xi_t = 1:xC
        for r = 1:xR
            for c = 1:xC
                if xi_f==r & xi_t==c
                    Jtemp{xi_f,xi_t}(r,c) = 0;
                else
                    DJ = eta*T(xi_f, xi_t, r, c)*((x(r,c)/t_passed)>theta)*((x(r,c)/t_passed)>theta);
                    Jtemp{xi_f,xi_t}(r,c)=J_old{xi_f,xi_t}(r,c)+DJ;
                end
            end
        end
        J_new{xi_f,xi_t} = W_T.*Jtemp{xi_f,xi_t}./(sum(Jtemp{xi_f,xi_t}(:))+c);
    end
end


end