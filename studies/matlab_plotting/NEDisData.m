clear all;
close all;
result=csvread('NE.csv',2);
num=length(result(:,1));

disOrg=result(:,1);
thkDisNE11=result(:,2);
thkDisNE22=result(:,4);

disOrg4=result(:,5);
thkDis4NE11=result(:,6);
thkDis4NE22=result(:,8);

disOrg6=result(:,9);
thkDis6NE11=result(:,10);
thkDis6NE22=result(:,12);


figure(1)
h1=plot(disOrg,thkDisNE11,'-o',disOrg,thkDisNE22,'-o',...
disOrg4,thkDis4NE11,'-s',disOrg4,thkDis4NE22,'-s',...
disOrg6,thkDis6NE11,'->',disOrg6,thkDis6NE22,'->');
h1(1).Color='black';
h1(2).Color=h1(1).Color;
h1(3).Color=h1(1).Color;
h1(4).Color=h1(1).Color;
h1(5).Color=h1(1).Color;
h1(6).Color=h1(1).Color;
h1(2).MarkerFaceColor='black';
h1(4).MarkerFaceColor='black';
h1(6).MarkerFaceColor='black';
axis([0 100 -0.2 1.8]);
%%%%%%%%%%%%%%%%%%%%
ax=gca;
ax.FontSize=18;
ax.TickDir='in';
% ax.YTick=[0, 0.2, 0.4, 0.6 , 0.8,1.0, 1.2];

xlabel('Distance[mm]','FontSize',18);
ylabel('Nominal Strain,\epsilon','FontSize',18);
% myLegend=legend('Original','Optimised(N=4)','Optimised(N=6)');
text([25], [0.5],'N=6','FontSize',18);
% line([25],[0.5],'-o')
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