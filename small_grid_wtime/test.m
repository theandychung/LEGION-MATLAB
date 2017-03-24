clc
u=[1 0 0 0 1
       0 1 0 0 1
       0 0 1 0 1
       0 0 0 1 1];
t =10;
delay = 1;
temp = fix(t/delay)

if (temp>=size(u,2)*2)
    out=zeros(size(u))
elseif (temp>=size(u,2))
%     out =fliplr(u)
    temp2 = fix((t-delay*size(u,2))/delay);
    out = [zeros(size(u,1),temp2+1) u(:,size(u,2):-1:temp2+2) ]
else
    out = [u(:,temp+1:-1:1) zeros(size(u,1),size(u,2)-temp-1)]
end