clear;
clc;

load('TireB_testdata.mat');  %试验数据 工作区

s_test1=Sa200; 
a= -0.06;          
b= 1.965;
c= 2.098;
d= 2.333;
Fy_exp200 = -200*(a*s_test1+b+c*(1-2*exp(-s_test1/d)));

B= -0.472;               
C= 0.535;
D= -4.814;
E= -1.83;
Fy_MF200 =-200*D*sin(C*atan((B*s_test1-E*(B*s_test1 - atan(B*s_test1)))));

s_test1=Sa600; 
a= -0.077;          
b= 1.994;
c= 2.133;
d= 3.401;
Fy_exp600=-600*(a*s_test1+b+c*(1-2*exp(-s_test1/d)));
B= 0.041;               
C= 6.295;
D= 3.094;
E= 7.181;
Fy_MF600 =-600*D*sin(C*atan((B*s_test1-E*(B*s_test1 - atan(B*s_test1)))));

s_test1=Sa1000; 
a= -0.058;          
b= 1.77;
c= 1.924;
d= 3.681;
Fy_exp1000=-1000*(a*s_test1+b+c*(1-2*exp(-s_test1/d)));

B= -0.177;               
C= 1.27;
D= -2.833;
E= -1.456;
Fy_MF1000 = -1000*D*sin(C*atan((B*s_test1-E*(B*s_test1 - atan(B*s_test1)))));

axes('position',[0.1,0.1,0.5,0.5]); 
h1=plot(Sa200(1:13:627),Fy200(1:13:627),'m*','LineWidth',0.5);
hold on;
plot(Sa600(1:13:627),Fy600(1:13:627),'m*','LineWidth',0.5);
hold on;
plot(Sa1000(1:13:630),Fy1000(1:13:630),'m*','LineWidth',0.5);

hold on;
h2=plot(Sa200,Fy_MF200,'--b','LineWidth',2);
hold on;
h3=plot(Sa200,Fy_exp200,'r','LineWidth',2);


hold on;
plot(Sa600,Fy_MF600,'--b','LineWidth',2);
hold on;
plot(Sa600,Fy_exp600,'r','LineWidth',2);

hold on;
plot(Sa1000,Fy_MF1000,'--b','LineWidth',2);
hold on;
plot(Sa1000,Fy_exp1000,'r','LineWidth',2);


legend([h1 h2 h3],'Test data','MF','HysTire','location','northeast','box','off');
xlabel('Slip angle{\it \alpha} (\circ)');
ylabel('Lateral force {\it F_y} (N)');
set(gca,'XTick',[0:5:15]);
set(gca,'YTick',[-3000:1000:0]);

text(5.5,-500,'{\it F_z}=200 N');%文字说明
text(5.5,-1550,'{\it F_z}=600 N');%文字说明
text(5.5,-2500,'{\it F_z}=1000 N');%文字说明

 axis([0 15 -3100 400]);
 
exp_error_a = Fy200 - Fy_exp200;
exp_mse_a = mse(exp_error_a);

MF_error_a =Fy200 - Fy_MF200;
MF_mse_a = mse(MF_error_a);

exp_error_b = Fy600 - Fy_exp600;
exp_mse_b = mse(exp_error_b);
MF_error_b = Fy600 - Fy_MF600;
MF_mse_b = mse(MF_error_b);

exp_error_c = Fy1000 - Fy_exp1000;
exp_mse_c = mse(exp_error_c);
MF_error_c = Fy1000 - Fy_MF1000;
MF_mse_c = mse(MF_error_c);