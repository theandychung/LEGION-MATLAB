close all
% filename = '20170324_19_49_36';
figure
subplot(1,2,1)
% plot(t,y(:,11),'-',t,y(:,12),'-.')
plot(t,y(:,7),'-',t,y(:,8),'-.')
xlim(tspan)
subplot(1,2,2)
plot(y(:,7),y(:,8))
suptitle(filename)
suptitle('3rd Oscillator')
xlim([-2.5,2])
uicontrol('Style', 'text',...
       'String', filename,... 
       'Units','normalized',...
       'Position', [0 0 0.1 0.1]); 
   %%
figure
subplot(1,2,1)
plot(t,y(:,9),'-',t,y(:,10),'-.')
xlim(tspan)
subplot(1,2,2)
plot(y(:,9),y(:,10))
suptitle(filename)
suptitle('4th Oscillator')
xlim([-2.5,2])
uicontrol('Style', 'text',...
       'String', filename,... 
       'Units','normalized',...
       'Position', [0 0 0.1 0.1]); 
%%
global num_z num_x grid_r grid_c
figure
subplot(4,1,1)
plot(t,y(:,1),'b-',t,y(:,2),'r-')
xlim(tspan)
x=2;
for i = num_z+1:2*grid_c:num_x*2+num_z
    subplot(grid_r+1,1,x)
    for j = 0:2:grid_c*2-2
        plot(t,y(:,i+j))
        hold on
    end
    xlim(tspan)
    x=x+1;
end
legend('1','2','3','4')

uicontrol('Style', 'text',...
       'String', filename,... 
       'Units','normalized',...
       'Position', [0 0 0.1 0.1]); 