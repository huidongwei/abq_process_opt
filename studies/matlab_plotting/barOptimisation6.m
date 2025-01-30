close all;

% Myweight={'Before' [12.5]
%            'After' [8.7]};
% h=bar([Myweight{:,2}]);
% set(gca,'XtickLabel',Myweight(:,1));

MyWei=[345.15 345.15 348.07 349.87 350.15 350.15]-273.15;
% fakeX=[1 2];
wd=0.4;
h=bar([1 2 3 4 5 6],MyWei,wd,'facecolor','r');
% hold on;
% h=bar(2,[8.7],wd,'facecolor','g');
% set(gca,'Xtick',[1 2]);
% set(gca,'XtickLabel',{'Original','Optimised'},'FontSize',18);
ylabel('Temperature [\circC]','FontSize',20);
xlabel('Zone No.','FontSize',20);
xlim([0 7]);
ylim([70 80]);
% set(gca,'YLabel','Weight','FontSize',18);
% set(gca,'XtickLabel',{none,'Original','Optimised',none});
ax=gca;
ax.FontSize=18;
% box off;
% h.BarWidth=0.8;