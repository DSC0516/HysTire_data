clear;
clc;
load('tireA_testdata.mat');  %试验数据

s_test1=SA_400; 
e= 0.004;          
f= 4.335;
g= 0.002;          
h= 1.938;

e1 =e*exp(-s_test1/f)-g*exp(-s_test1/h);
a= 0.017;          
b= 1.429;
c= 1.326;
d= 2.391;
Fy=400*(a*s_test1+b+c*(1-2*exp(-s_test1/d)));
B= -0.212;               
C= -2.739;
D= 1.383;
E= 0.468;
Mz_MF400 =16*D*sin(C*atan((B*s_test1-E*(B*s_test1 - atan(B*s_test1)))));
Mz_exp400 =e1.*Fy*16;

s_test1=SA_600; 
e= -0.002;          
f= 2.793;
g= -0.003;          
h= 4.039;
a= 0.009;          
b= 1.448;
c= 1.387;
d= 2.749;
Fy_exp600=600*(a*s_test1+b+c*(1-2*exp(-s_test1/d)));
e1 =e*exp(-s_test1/f)-g*exp(-s_test1/h);
Mz_exp600 =e1.*Fy_exp600*36;
B= -0.204;               
C= -2.677;
D= 0.919;
E= 0.321;
Mz_MF600 =36*D*sin(C*atan((B*s_test1-E*(B*s_test1 - atan(B*s_test1)))));

s_test1=SA_800; 

e= 0.099;          
f= 3.597;
g= 0.098;          
h= 3.572;

a= 0.01;          
b= 1.409;
c= 1.401;
d= 2.887;
Fy=800*(a*s_test1+b+c*(1-2*exp(-s_test1/d)));
e1 =e*exp(-s_test1/f)-g*exp(-s_test1/h);
Mz_exp800 =e1.*Fy*48;
B= -0.191;               
C= 2.731;
D= -1.029;
E= 0.344;
Mz_MF800 =48*D*sin(C*atan((B*s_test1-E*(B*s_test1 - atan(B*s_test1)))));

axes('position',[0.1,0.1,0.5,0.5]); 

axis([0 15 -5 85]);
h1=plot(SA_400(1:10:632),Mz_400(1:10:632),'m*','LineWidth',0.5);
hold on;
plot(SA_600(1:10:632),Mz_600(1:10:632),'m*','LineWidth',0.5);
hold on;
plot(SA_800(1:10:630),Mz_800(1:10:630),'m*','LineWidth',0.5);



hold on;
h2=plot(SA_400(1:10:632),Mz_MF400(1:10:632),'--b','LineWidth',2);
hold on;
h3=plot(SA_400,Mz_exp400,'r','LineWidth',2);


hold on;
h2=plot(SA_600,Mz_MF600,'--b','LineWidth',2);
hold on;
h3=plot(SA_600,Mz_exp600,'r','LineWidth',2);

hold on;
h2=plot(SA_800,Mz_MF800,'--b','LineWidth',2);
hold on;
h3=plot(SA_800,Mz_exp800,'r','LineWidth',2);


legend([h1 h2 h3],'Test data','MF','HysTire','location','northeast','box','off');
xlabel('Slip angle{\it \alpha} (\circ)');
ylabel('Aligning torque{\it M_z} (Nm)');
set(gca,'XTick',[0:5:15]);
set(gca,'YTick',[0:20:80]);

text(11.5,0,'{\it F_z}=400 N');%文字说明
text(10.2,13,'{\it F_z}=600 N');%文字说明
text(8,30,'{\it F_z}=800 N');%文字说明

 axis([0 15 -5 60]);
exp_error_a = Mz_400 - Mz_exp400;
exp_mse_a = mse(exp_error_a);

MF_error_a = Mz_400 - Mz_MF400;
MF_mse_a = mse(MF_error_a);

exp_error_b = Mz_600 - Mz_exp600;
exp_mse_b = mse(exp_error_b);
MF_error_b = Mz_600 - Mz_MF600;
MF_mse_b = mse(MF_error_b);

exp_error_c =Mz_800 - Mz_exp800;
exp_mse_c = mse(exp_error_c);
MF_error_c = Mz_800(1:10:630) - Mz_MF800(1:10:630);
MF_mse_c = mse(MF_error_c);
