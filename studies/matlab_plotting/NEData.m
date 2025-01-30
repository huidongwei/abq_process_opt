clear all;
close all;
result=csvread('NEResults.csv',1);
num=length(result(:,1));
iterations=linspace(1,num,num);
time=result(:,1);
zone4NE11=result(:,2);
zone3NE11=result(:,4);
zone1NE11=result(:,6);
zone2NE11=result(:,8);

zone4NE22=result(:,10);
zone3NE22=result(:,12);
zone1NE22=result(:,14);
zone2NE22=result(:,16);


figure(1)
h1=plot(time,zone1NE11,'-o',time,zone2NE11,'-s',time,zone3NE11,'-d',time,zone4NE11,'->');
h1(1).Color='black';
h1(2).Color=h1(1).Color;
h1(3).Color=h1(1).Color;
h1(4).Color=h1(1).Color;
% h1(2).MarkerFaceColor='black';
axis([0 0.2 -0.2 1.8]);
myLegend=legend('Zone 1','Zone 2','Zone 3','Zone 4');
%%%%%%%%%%%%%%%%%%%%
ax=gca;
ax.FontSize=18;
ax.TickDir='in';
% ax.YTick=[0, 0.2, 0.4, 0.6 , 0.8,1.0, 1.2];

xlabel('Time[s]','FontSize',18);
ylabel('Nominal Strain, \epsilon_{11}','FontSize',18);
% text([25], [0.5],'N=6','FontSize',18);
%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
h1=plot(time,zone1NE22,'-o',time,zone2NE22,'-s',time,zone3NE22,'-d',time,zone4NE22,'->');
h1(1).Color='black';
h1(2).Color=h1(1).Color;
h1(3).Color=h1(1).Color;
h1(4).Color=h1(1).Color;
h1(1).MarkerFaceColor='black';
h1(2).MarkerFaceColor='black';
h1(3).MarkerFaceColor='black';
h1(4).MarkerFaceColor='black';
axis([0 0.2 -0.2 1.8]);
myLegend=legend('Zone 1','Zone 2','Zone 3','Zone 4');
%%%%%%%%%%%%%%%%%%%%
ax=gca;
ax.FontSize=18;
ax.TickDir='in';
% ax.YTick=[0, 0.2, 0.4, 0.6 , 0.8,1.0, 1.2];

xlabel('Time[s]','FontSize',18);
ylabel('Nominal Strain, \epsilon_{22}','FontSize',18);
% text([25], [0.5],'N=6','FontSize',18);