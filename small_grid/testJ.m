clear
clc
input=[1 1 1
    2 2 2
    3 3 3];
[t,y] = ode23(@(t,y) test( t, y, input),tspan,y0);