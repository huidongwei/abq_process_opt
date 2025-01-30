clear all;
close all;
result=csvread('outputData6.csv');
num=length(result(:,1));
iterations=linspace(1,num,num);
ratios=result(:,1);
zone1STH=result(:,2);
zone2STH=result(:,3);
zone3STH=result(:,4);
zone4STH=result(:,5);
zone5STH=result(:,6);
zone6STH=result(:,7);
zone1Temp=result(:,2+6);
zone2Temp=result(:,3+6);
zone3Temp=result(:,4+6);
zone4Temp=result(:,5+6);
zone5Temp=result(:,6+6);
zone6Temp=result(:,7+6);
% zone1NE11=result(:,2+8);
% zone2NE11=result(:,3+8);
% zone3NE11=result(:,4+8);
% zone4NE11=result(:,5+8);
% zone1NE22=result(:,2+12);
% zone2NE22=result(:,3+12);
% zone3NE22=result(:,4+12);
% zone4NE22=result(:,5+12);
minRatio=0.0;
for i=1:num
    if minRatio<ratios(i)& i>120 & zone6Temp(i)< 350.25 & zone5Temp(i)< 350.25 & zone4Temp(i)< 350.25
        minRatio=ratios(i);
        Temp(1)=zone1Temp(i);
        Temp(2)=zone2Temp(i);
        Temp(3)=zone3Temp(i);
        Temp(4)=zone4Temp(i);
        Temp(5)=zone5Temp(i);
        Temp(6)=zone6Temp(i);
        resNum=i;
    end
end
figure(1)
h=plot(iterations,ratios,'-');


axis([0 200 0.25 0.55]);
ax=gca;
ax.FontSize=18;
ax.TickDir='in';
xlabel('iterations','FontSize',18);
ylabel('(STH)_{min}/(STH)_{max}','FontSize',18);
text([25], [0.5],'N=6','FontSize',18);
%Set the right and upper tick out
%remove the box of the current position
% set(ax,'box','off','color','none');
% %build a new box without tick
% b=axes('Position',get(ax,'Position'),'box','on','xtick',[],'ytick',[]);
% axes(ax);
% linkaxes([ax b]);
% axis([0 70 0.2 0.5]);
figure(2)
% plot(iterations,zone1STH/2.0,'o',iterations,zone2STH/2.0,'o',...
%     iterations,zone3STH/2.0,'o',iterations,zone4STH/2.0,'o');
plot(iterations,zone1STH/2.0,'-',iterations,zone2STH/2.0,'-',...
    iterations,zone3STH/2.0,'-',iterations,zone4STH/2.0,'-',...
    iterations,zone5STH/2.0,'-',iterations,zone6STH/2.0,'-');
axis([0 num 0 0.9]);
legend('1','2','3','4','5','6');
figure(3)
% plot(iterations,zone1STH/2.0,'o',iterations,zone2STH/2.0,'o',...
%     iterations,zone3STH/2.0,'o',iterations,zone4STH/2.0,'o');
plot(iterations,zone1Temp,'-',iterations,zone2Temp,'-',...
    iterations,zone3Temp,'-',iterations,zone4Temp,'-',...
    iterations,zone5Temp,'-',iterations,zone6Temp,'-');
axis([0 200 343 353]);
Temp