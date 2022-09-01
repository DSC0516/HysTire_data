clear;
clc;
load('tireA_testdata.mat');  %试验数据 

s_test1=SR_1200; 
p= -7.031;          
q= 1.419;
r= 1.408;
w= 0.089;
Fx_exp_1200 =2000*(p*s_test1+q+r*(1-2*exp(-s_test1/w)));

B= -6.805;               
C= 1.684;
D= -1.79;
E= 2.433;
s_MF_1200=s_test1;
Fx_MF_1200 = 2000*D*sin(C*atan((B*s_MF_1200-E*(B*s_MF_1200 - atan(B*s_MF_1200)))));

s_test1=SR_900;
p= -6.542;          
q= 1.352;
r= 1.364;
w= 0.071;
Fx_exp_900 =1500*(p*s_test1+q+r*(1-2*exp(-s_test1/w)));

B= -2.191;               
C= 7.99;
D= -1.408;
E= 9.565;
s_MF900=SR_900;
Fx_MF_900 = 1500*D*sin(C*atan((B*s_MF900-E*(B*s_MF900 - atan(B*s_MF900)))));

s_test600=SR_600;
p= -5.173;          
q= 1.196;
r= 1.283;
w= 0.049;
Fx_exp_600 =1000*(p*s_test600+q+r*(1-2*exp(-s_test600/w)));

B= -4.41;               
C= -4.52;
D= 1.648;
E= 4.897;
s_MF600=SR_600;
Fx_MF_600 = 1000*D*sin(C*atan((B*s_MF600-E*(B*s_MF600 - atan(B*s_MF600)))));


axes('position',[0.1,0.1,0.5,0.5]); 
h1=plot(SR_1200(1:10:320),Fx_1200(1:10:320),'m*','LineWidth',0.5);
hold on;
plot(SR_900(1:10:352),Fx_900(1:10:352),'m*','LineWidth',0.5);
hold on;
plot(SR_600(1:10:301),Fx_600(1:10:301),'m*','LineWidth',0.5);

hold on;
h2=plot(SR_1200,Fx_MF_1200,'--b','LineWidth',2);
hold on;
plot(SR_900,Fx_MF_900,'--b','LineWidth',2);
hold on;
plot(SR_600,Fx_MF_600,'--b','LineWidth',2);

hold on;
h3=plot(SR_1200,Fx_exp_1200,'r','LineWidth',2);
hold on;
plot(SR_900,Fx_exp_900,'r','LineWidth',2);
hold on;
plot(SR_600,Fx_exp_600,'r','LineWidth',2);

legend([h1 h2 h3],'Test data','MF','HysTire','location','northwest','box','off');
xlabel('Slip ratio{\it s} (-)');
ylabel('Longitudinal force{\it F_x} (N)');
set(gca,'XTick',[0:0.05:0.2]);
set(gca,'YTick',[0:1000:3000]);

text(0.14,1700,'{\it F_z}=600 N');%文字说明
text(0.14,2250,'{\it F_z}=900 N');%文字说明
text(0.14,2750,'{\it F_z}=1200 N');%文字说明

axis([0 0.2 0 3000]);
exp_error_1200 = Fx_1200 - Fx_exp_1200;
exp_mse_1200 = mse(exp_error_1200);

MF_error_1200 = Fx_1200 - Fx_MF_1200;
MF_mse_1200 = mse(MF_error_1200);

exp_error_900 = Fx_900 - Fx_exp_900;
exp_mse_900 = mse(exp_error_900);
MF_error_900 = Fx_900 - Fx_MF_900;
MF_mse_900 = mse(MF_error_900);

exp_error_600 = Fx_600 - Fx_exp_600;
exp_mse_600 = mse(exp_error_600);
MF_error_600 = Fx_600 - Fx_MF_600;
MF_mse_600 = mse(MF_error_600);
