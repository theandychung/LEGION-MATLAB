tspan=[0 100];
y0=0;
global JJ
JJ=0;
[t,y] = ode45(@(t,y) test(t, y),tspan,y0);
plot(t,y)
figure
plot(t,t.^2)