clc;clear
ttt.a=[1,2,3;2,3,4]
ttt.b=[1,2,4];
A = 1;
B = 2;
tspan = [0 5];
y0 = [0 0.01];
[t,y] = ode45(@(t,y) odefcnxx(t,y,A,B,ttt,ttt.a), tspan, y0);