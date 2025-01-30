close all;

% Myweight={'Before' [12.5]
%            'After' [8.7]};
% h=bar([Myweight{:,2}]);
% set(gca,'XtickLabel',Myweight(:,1));

MyWei=[12.5 8.7];
% fakeX=[1 2];
wd=0.3;
h=bar(1,[12.5],wd,'facecolor','r');
hold on;
h=bar(2,[8.7],wd,'facecolor','g');
set(gca,'Xtick',[1 2]);
set(gca,'XtickLabel',{'Original','Optimised'},'FontSize',18);
ylabel('Weight [g]','FontSize',20);
% set(gca,'YLabel','Weight','FontSize',18);
% set(gca,'XtickLabel',{none,'Original','Optimised',none});
box off;
% h.BarWidth=0.8;