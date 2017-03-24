
function Jtemp = J( x, J_old,h)
%Dynamic Connection Weights


%% initialization
W_T = 1;
eta = 1;
c = 1E-99;
[xR,xC] = size(x);
Jtemp=cell(xR,xC);
for i = 1:xR
    for j = 1:xC
        Jtemp{i,j} = zeros(1, 4);
    end
end

%%
for xi_f = 1:xR
    for xi_t = 1:xC
        %up
        if(xi_f-1>0)
            DJ = eta*T(xi_f, xi_t, xi_f-1, xi_t) * h(xi_f,xi_t) * h(xi_f-1, xi_t);
            Jtemp{xi_f,xi_t}(1)=J_old{xi_f,xi_t}(1)+DJ;
        end
        %down
        if(xi_f+1<xR)
            DJ = eta*T(xi_f, xi_t, xi_f+1, xi_t) * h(xi_f,xi_t) * h(xi_f+1, xi_t);
            Jtemp{xi_f,xi_t}(2)=J_old{xi_f,xi_t}(2)+DJ;
        end
        %left
        if(xi_t-1>0)
            DJ = eta*T(xi_f, xi_t, xi_f, xi_t-1) * h(xi_f,xi_t) * h(xi_f, xi_t-1);
            Jtemp{xi_f,xi_t}(3)=J_old{xi_f,xi_t}(3)+DJ;
        end
        %right
        if(xi_t+1<xC)
            DJ = eta*T(xi_f, xi_t, xi_f, xi_t+1) * h(xi_f,xi_t) * h(xi_f, xi_t+1);
            Jtemp{xi_f,xi_t}(4)=J_old{xi_f,xi_t}(4)+DJ;
        end
        Jtemp{xi_f,xi_t} = W_T.*Jtemp{xi_f,xi_t}./(sum(Jtemp{xi_f,xi_t}(:))+c);
    end
end

end
    
