 clear;
 clc;
 load('mse.mat');

 %% 
axes2=axes('position',[0.2,0.2,0.7,0.7]);
bar(mm);
set(gca,'XTickLabel',{' ','Tire A',' ',' ','Tire B',' '}); 
ylabel('MSE of \itF_x \rm(N^2)');
legend('HysTire','MF','location','northwest');
  set(gca,'Ytick',[0,5000,10000,15000]) 
close;
  %% 
 axes3=axes('position',[0.2,0.2,0.7,0.7]);
bar(mn);
set(gca,'XTickLabel',{' ','Tire A',' ',' ','Tire B',' '}); 
ylabel('MSE of \itF_y \rm(N^2)');
legend('HysTire','MF','location','northwest');
%  ylim([0,0.3]);
  set(gca,'Ytick',[0,700,1400,2100,2800,3500]) 
close; 
  %%   
 axes4=axes('position',[0.2,0.2,0.7,0.7]);
bar(mo);
set(gca,'XTickLabel',{' ','Tire A',' ',' ','Tire B',' '}); 
ylabel('MSE of \itM_z \rm((Nm)^2)');
legend('HysTire','MF','location','northwest');
  set(gca,'Ytick',[0,10,20,30,40,50,60]) 
