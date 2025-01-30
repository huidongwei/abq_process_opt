clear all;
close all;
result=csvread('thkDisOpt4.csv',1);
num=length(result(:,1));
iterations=linspace(1,num,num);
time=result(:,1);

disOrg=result(:,1);
thkDis=result(:,2);

disOrg4=result(:,3);
thkDis4=result(:,4);

disOrg6=result(:,5);
thkDis6=result(:,6);


figure(1)
h1=plot(disOrg,thkDis,'-o',disOrg4,thkDis4,'-s',disOrg6,thkDis6,'->');
h1(1).Color='black';
h1(2).Color=h1(1).Color;
h1(3).Color=h1(1).Color;
% h1(1).MarkerFaceColor='black';
% h1(2).MarkerFaceColor='black';
% h1(3).MarkerFaceColor='black';
axis([-2 100 0.4 2.0]);
%%%%%%%%%%%%%%%%%%%%
ax=gca;
ax.FontSize=18;
ax.TickDir='in';
% ax.YTick=[0, 0.2, 0.4, 0.6 , 0.8,1.0, 1.2];

xlabel('Distance[mm]','FontSize',18);
ylabel('STH[mm]','FontSize',18);
myLegend=legend('T_{opt}(N=4)','T_{opt}-1\circC(N=4)','T_{opt}+1\circC(N=4)');
% text([25], [0.5],'N=6','FontSize',18);
% figure(2)
% plot(time,zone2NE11,time,zone2NE22);
% axis([0 0.2 -0.1 1.2]);
% figure(3)
% plot(time,zone3NE11,time,zone3NE22);
% axis([0 0.2 -0.1 1.2]);
% figure(4)
% plot(time,zone4NE11,time,zone4NE22);
% axis([0 0.2 -0.1 1.2]);