clear
clc
x=ones(3);

[xR,xC] = size(x);
J_old=cell(xR,xC);
for i = 1:xR
    for j = 1:xC
        J_old{i,j} = zeros(xR, xC);
    end
end
J_new=J(x,J_old);