clear;
clc;
load('tireA_testdata.mat');

s_test1=SA_400; 
B= -0.348;               
C= 0.941;
D= -3.222;
E= 0.489;
p= 0.017;          
q= 1.429;
r= 1.326;
w= 2.391;
Fy_exp400=-400*(p*s_test1+q+r*(1-2*exp(-s_test1/w)));
Fy_MF400 =-400*D*sin(C*atan((B*s_test1-E*(B*s_test1 - atan(B*s_test1)))));

s_test1=SA_600; 
p= 0.009;          
q= 1.448;
r= 1.387;
w= 2.749;
Fy_exp600=-600*(p*s_test1+q+r*(1-2*exp(-s_test1/w)));
B= 0.35;               
C= 0.754;
D= 3.539;
E= 0.274;
Fy_MF600 =-600*D*sin(C*atan((B*s_test1-E*(B*s_test1 - atan(B*s_test1)))));

s_test1=SA_800; 
B= 0.277;               
C= 0.934;
D= 3.123;
E= 0.115;
p= 0.01;          
q= 1.409;
r= 1.401;
w= 2.887;
Fy_exp800=-800*(p*s_test1+q+r*(1-2*exp(-s_test1/w)));
Fy_MF800= -800*D*sin(C*atan((B*s_test1-E*(B*s_test1 - atan(B*s_test1)))));

axes('position',[0.1,0.1,0.5,0.5]); 
h1=plot(SA_400(1:10:632),Fy_400(1:10:632),'m*','LineWidth',0.5);
hold on;
plot(SA_600(1:10:632),Fy_600(1:10:632),'m*','LineWidth',0.5);
hold on;
plot(SA_800(1:10:630),Fy_800(1:10:630),'m*','LineWidth',0.5);
hold on;
h2=plot(SA_600,Fy_MF600,'--b','LineWidth',2);
hold on;
h3=plot(SA_600,Fy_exp600,'r','LineWidth',2);
hold on;
h2=plot(SA_400,Fy_MF400,'--b','LineWidth',2);
hold on;
h3=plot(SA_400,Fy_exp400,'r','LineWidth',2);
hold on;
h2=plot(SA_800,Fy_MF800,'--b','LineWidth',2);
hold on;
h3=plot(SA_800,Fy_exp800,'r','LineWidth',2);


legend([h1 h2 h3],'Test data','MF','HysTire','location','northeast','box','off');
xlabel('Slip angle{\it \alpha} (\circ)');
ylabel('Lateral force{\it F_y} (N)');
set(gca,'XTick',[0:5:15]);
set(gca,'YTick',[-2400:800:5]);

text(11.5,-1350,'{\it F_z}=400 N');%文字说明
text(11.5,-1900,'{\it F_z}=600 N');%文字说明
text(11.5,-2450,'{\it F_z}=800 N');%文字说明

 axis([0 15 -2600 5]);
 
exp_error_a = Fy_400 - Fy_exp400;
exp_mse_a = mse(exp_error_a);

MF_error_a = Fy_400 - Fy_MF400;
MF_mse_a = mse(MF_error_a);

exp_error_b = Fy_600 - Fy_exp600;
exp_mse_b = mse(exp_error_b);
MF_error_b = Fy_600 - Fy_MF600;
MF_mse_b = mse(MF_error_b);

exp_error_c =Fy_800 - Fy_exp800;
exp_mse_c = mse(exp_error_c);
MF_error_c = Fy_800 - Fy_MF800;
MF_mse_c = mse(MF_error_c);
