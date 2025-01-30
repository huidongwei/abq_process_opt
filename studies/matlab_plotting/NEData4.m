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
h1=plot(time,zone1NE11,'-o',time,zone1NE22,'-o');
h1(1).Color='black';
h1(2).Color=h1(1).Color;
h1(2).MarkerFaceColor='black';
axis([0 0.2 -0.1 1.4]);
hold on;
h2=plot(time,zone2NE11,'-s',time,zone2NE22,'-s');
h2(1).Color='black';
h2(2).Color=h2(1).Color;
h2(2).MarkerFaceColor='black';
h3=plot(time,zone3NE11,'-d',time,zone3NE22,'-d');
h3(1).Color='black';
h3(2).Color=h3(1).Color;
h3(2).MarkerFaceColor='black';
h4=plot(time,zone4NE11,'-^',time,zone4NE22,'-^');
h4(1).Color='black';
h4(2).Color=h4(1).Color;
h4(2).MarkerFaceColor='black';
%%%%%%%%%%%%%%%%%%%%
ax=gca;
ax.FontSize=18;
ax.TickDir='in';
ax.YTick=[0, 0.2, 0.4, 0.6 , 0.8,1.0, 1.2];

xlabel('Time[s]','FontSize',18);
ylabel('Nominal Strain, \epsilon','FontSize',18);
text([25], [0.5],'N=6','FontSize',18);
% figure(2)
% plot(time,zone2NE11,time,zone2NE22);
% axis([0 0.2 -0.1 1.2]);
% figure(3)
% plot(time,zone3NE11,time,zone3NE22);
% axis([0 0.2 -0.1 1.2]);
% figure(4)
% plot(time,zone4NE11,time,zone4NE22);
% axis([0 0.2 -0.1 1.2]);