clear;
clc;
load('TireB_testdata.mat');  %试验数据 工作区

s_test1=Sa200;

e= -0.05;          
f= 2.689;
g= -0.072;          
h= 4.361;
% % Fy计算

a= -0.06;          
b= 1.965;
c= 2.098;
d= 2.333;
Fy = 200*(a*s_test1+b+c*(1-2*exp(-s_test1/d)));
e1 =e*exp(-s_test1/f)-g*exp(-s_test1/h);
Mz_exp200 =e1.*Fy;
B= 0.739;               
C= 0.13;
D= 0.542;
E= 1.192;
Mz_MF200 =200*D*sin(C*atan((B*s_test1-E*(B*s_test1 - atan(B*s_test1)))));

s_test1=Sa600;
e= 1.126;          
f= 14.327;
g= 1.088;          
h= 14.717;
% % Fy计算
a= -0.077;          
b= 1.994;
c= 2.133;
d= 3.401;
Fy=600*(a*s_test1+b+c*(1-2*exp(-s_test1/d)));
e1 =e*exp(-s_test1/f)-g*exp(-s_test1/h);
Mz_exp600 =e1.*Fy;
B= -0.169;               
C= 2.512;
D= -0.122;
E= -0.164;
Mz_MF600 =300*D*sin(C*atan((B*s_test1-E*(B*s_test1 - atan(B*s_test1)))));


s_test1=Sa1000;
e= -0.844;          
f= 2.826;
g= -0.845;          
h= 3.19;
% % Fy计算
a= -0.058;          
b= 1.77;
c= 1.924;
d= 3.681;
Fy=1000*(a*s_test1+b+c*(1-2*exp(-s_test1/d)));
e1 =e*exp(-s_test1/f)-g*exp(-s_test1/h);
Mz_exp1000 =e1.*Fy;
B= -0.135;               
C= 2.448;
D= -0.153;
E= -1.215;
Mz_MF1000 =500*D*sin(C*atan((B*s_test1-E*(B*s_test1 - atan(B*s_test1)))));

axes('position',[0.1,0.1,0.5,0.5]); 
h1=plot(Sa200(1:13:627),Mz200(1:13:627),'m*','LineWidth',0.5);
hold on;
plot(Sa600(1:13:627),Mz600(1:13:627),'m*','LineWidth',0.5);
hold on;
plot(Sa1000(1:13:630),Mz1000(1:13:630),'m*','LineWidth',0.5);

hold on;
h2=plot(Sa200,Mz_MF200,'--b','LineWidth',2);
hold on;
h3=plot(Sa200,Mz_exp200,'r','LineWidth',2);


hold on;
plot(Sa600,Mz_MF600,'--b','LineWidth',2);
hold on;
plot(Sa600,Mz_exp600,'r','LineWidth',2);

hold on;
plot(Sa1000(1:10:630),Mz_MF1000(1:10:630),'--b','LineWidth',2);
hold on;
plot(Sa1000,Mz_exp1000,'r','LineWidth',2);


legend([h1 h2 h3],'Test data','MF','HysTire','location','northeast','box','off');
xlabel('Slip angle{\it \alpha} (\circ)');
ylabel('Aligning torque {\it M_z} (Nm)');
set(gca,'XTick',[0:5:15]);
set(gca,'YTick',[0:20:85]);

text(11.5,1,'{\it F_z}=200 N');%文字说明
text(11.5,13,'{\it F_z}=600 N');%文字说明
text(11.2,30,'{\it F_z}=1000 N');%文字说明

 axis([0 15 -5 85]);
exp_error_a = Mz200 - Mz_exp200;
exp_mse_a = mse(exp_error_a);

MF_error_a =Mz200 - Mz_MF200;
MF_mse_a = mse(MF_error_a);

exp_error_b = Mz600 - Mz_exp600;
exp_mse_b = mse(exp_error_b);
MF_error_b = Mz600 - Mz_MF600;
MF_mse_b = mse(MF_error_b);

exp_error_c = Mz1000 - Mz_exp1000;
exp_mse_c = mse(exp_error_c);
MF_error_c = Mz1000 - Mz_MF1000;
MF_mse_c = mse(MF_error_c);

