% close all

if (exist('filename','var'))
    filename= '';
end
% %%
% figure
% subplot(1,2,1)
% plot(t,y(:,7),'-',t,y(:,8),'-.')
% xlim(tspan)
% 
% subplot(1,2,2)
% x = linspace(-2.5,2.5);
% plot(x, 3.*x-x.^3+2+u.input(7-2), x, u.gamma.*(1+tanh(x./u.beta)))
% hold on
% p1=plot(y(:,7),y(:,8));
% p1.Marker = '*';
% suptitle('3rd Oscillator')
% xlim([-2.5,2.5])
% 
% uicontrol('Style', 'text',...
%        'String', filename,... 
%        'Units','normalized',...
%        'Position', [0 0 0.1 0.1]); 
% %%
% figure
% subplot(1,2,1)
% plot(t,y(:,9),'-',t,y(:,10),'-.')
% xlim(tspan)
% 
% subplot(1,2,2)
% x = linspace(-2.5,2.5);
% plot(x, 3.*x-x.^3+2+u.input(9-2), x, u.gamma*(1+tanh(x/u.beta)))
% hold on
% p1 = plot(y(:,9),y(:,10));
% p1.Marker = '*';
% suptitle('4th Oscillator')
% xlim([-2.5,2.5])
% 
% uicontrol('Style', 'text',...
%        'String', filename,... 
%        'Units','normalized',...
%        'Position', [0 0 0.1 0.1]); 
%%

% start=1000;
start=0;
ender=tspan(2);
% ender=2000;

figure
sp1 = subplot(u.grid_r+1,1,1);
plot(t,y(:,1),'b-',t,y(:,2),'r-')
xlim([start ender])
ylabel('Z Activity')
legend('z1','z2')
x=2;
for a = u.num_z+1:2:u.num_x*2+u.num_z
    if x > u.grid_r+1
        x = 2;
    end
    subplot(u.grid_r+1,1,x);
    plot(t,y(:,a))
    xlim([start ender])
    ylim([-2 2])
    x=x+1;
    ylabel('X Activity')
    hold on
end
xlabel('Time')

% dynamic legend
if(~exist('grid_c','var'))
    grid_c = size(u.input,2);
end
strx=cell(1,grid_c);
for a = 1:grid_c
    strx{a} = sprintf('Oscillator %d', a);
end
legend(strx)

strz = cell(1,u.num_z);
for a = 1:u.num_z
    strz{a} = sprintf('Inhibitor z_%d',a);
end
legend(sp1,strz);

u.input

% uicontrol('Style', 'text',...
%        'String', filename,... 
%        'Units','normalized',...
%        'Position', [0 0 .1 .1]); 
% h = axes('Position',[0 0 1 1],'Visible','off'); %add an axes on the left side of your subplots
% set(gcf,'CurrentAxes',h)
% text(.08,.45,'X Activities',...
% 'VerticalAlignment','bottom',...
% 'HorizontalAlignment','left', 'Rotation', 90)

