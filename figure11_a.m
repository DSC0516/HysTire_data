clear;
clc;

load('TireB_testdata.mat');  %试验数据 工作区
s_test1=0:0.01:0.14;
p= -4.965;          
q= 1.985;
r= 2.038;
w= 0.044;
u_sim1 =(p*s_test1+q+r*(1-2*exp(-s_test1/w)));
a_m = 0.14;%最大值横坐标
a_b = 0.05;%第二段加载初点横坐标
a_o = 1;%横坐标最大值
Fa_m= p*a_m+q+r*(1-2*exp(-a_m/w));
Fa_b= p*a_b+q+r*(1-2*exp(-a_b/w));
f1 = (a_m-a_b)/(a_o-a_m);
s_test2=0.14:0.001:1;
u_sim2 = Fa_m+Fa_b-p*(a_b+f1*(s_test2-a_m))-q-r*(1-2*exp(-(a_b+f1*(s_test2-a_m))/w));
Fx_cau1_600=u_sim1*600;
Fx_cau2_600=u_sim2*600;
s1_600=s_test1;
s2_600=s_test2;
B= -7.918;               
C= -2.594;
D= 3.188;
E= 1.863;
s_MF600=0:0.01:0.3;
Fx_MF_600 = 600*D*sin(C*atan((B*s_MF600-E*(B*s_MF600 - atan(B*s_MF600)))));

s_test1=0:0.001:0.15; 
p= -6.269;          
q= 1.819;
r= 2.015;
w= 0.054;
u_sim1 =p*s_test1+q+r*(1-2*exp(-s_test1/w));
a_m = 0.15;%最大值横坐标
a_b = 0.05;%第二段加载初点横坐标
a_o = 1;%横坐标最大值
Fa_m= p*a_m+q+r*(1-2*exp(-a_m/w));
Fa_b= p*a_b+q+r*(1-2*exp(-a_b/w));
f1 = (a_m-a_b)/(a_o-a_m);
s_test2=0.15:0.001:1;
u_sim2 = Fa_m+Fa_b-p*(a_b+f1*(s_test2-a_m))-q-r*(1-2*exp(-(a_b+f1*(s_test2-a_m))/w));
Fx_cau1_900=u_sim1*900;
Fx_cau2_900=u_sim2*900;
s1_900=s_test1;
s2_900=s_test2;
B= 4.79;               
C= 3.608;
D= 2.66;
E= 3.135;
s_MF900=0:0.01:0.3;
Fx_MF_900 = 900*D*sin(C*atan((B*s_MF900-E*(B*s_MF900 - atan(B*s_MF900)))));
s_test1=0:0.01:0.16;
p= -6.686;          
q= 1.95;
r= 1.991;
w= 0.073;
u_sim1=p*s_test1+q+r*(1-2*exp(-s_test1/w));
a_m = 0.16;%最大值横坐标
a_b = 0.05;%第二段加载初点横坐标
a_o = 1;%横坐标最大值
Fa_m= p*a_m+q+r*(1-2*exp(-a_m/w));
Fa_b= p*a_b+q+r*(1-2*exp(-a_b/w));
f1 = (a_m-a_b)/(a_o-a_m);
s_test2=0.16:0.01:1;
u_sim2 = Fa_m+Fa_b-p*(a_b+f1*(s_test2-a_m))-q-r*(1-2*exp(-(a_b+f1*(s_test2-a_m))/w));
Fx_cau1_1200=u_sim1*1200;
Fx_cau2_1200=u_sim2*1200;
s1_1200=s_test1;
s2_1200=s_test2;
B= -8.774;               
C= -1.037;
D= 4.142;
E= 1.58;
s_MF1200=0:0.01:0.3;
Fx_MF_1200 = 1200*D*sin(C*atan((B*s_MF1200-E*(B*s_MF1200 - atan(B*s_MF1200)))));

axes('position',[0.1,0.1,0.5,0.5]); 
h1=plot(SR600(1:13:852),FX600(1:13:852),'m*','LineWidth',0.5);
hold on;
plot(SR900(1:13:812),FX900(1:13:812),'m*','LineWidth',0.5);
hold on;
plot(SR1200(1:13:759),FX1200(1:13:759),'m*','LineWidth',0.5);

hold on;
h2=plot(s_MF600(1:25),Fx_MF_600(1:25),'--b','LineWidth',2);
hold on;
h3=plot(s1_600,Fx_cau1_600,'r','LineWidth',2);
hold on;
plot(s2_600,Fx_cau2_600,'r','LineWidth',2);


hold on;
plot(s_MF900(1:25),Fx_MF_900(1:25),'--b','LineWidth',2);
hold on;
plot(s1_900,Fx_cau1_900,'r','LineWidth',2);
hold on;
plot(s2_900,Fx_cau2_900,'r','LineWidth',2);

hold on;
plot(s_MF1200(1:25),Fx_MF_1200(1:25),'--b','LineWidth',2);
hold on;
plot(s1_1200,Fx_cau1_1200,'r','LineWidth',2);
hold on;
plot(s2_1200,Fx_cau2_1200,'r','LineWidth',2);


legend([h1 h2 h3],'Test data','MF','HysTire','location','northeast','box','off');
xlabel('Slip ratio{\it s} (-)');
ylabel('Longitudinal force {\it F_x} (N)');
set(gca,'XTick',[0:0.1:0.5]);
set(gca,'YTick',[0:1000:3000]);

text(0.3,1400,'{\it F_z}=600 N');%文字说明
text(0.3,1850,'{\it F_z}=900 N');%文字说明
text(0.3,2300,'{\it F_z}=1200 N');%文字说明

 axis([0 0.5 0 3500]);
print -depsc C:\Users\86152\OneDrive\duan\OneDrive\Lasis\010-轮胎模型\HysTire\figure\newfigure\11_a
%% MSE 

p= -5.393;          
q= 2.037;
r= 2.075;
w= 0.046;

Fx_exp_600 =600*(p*SR600+q+r*(1-2*exp(-SR600/w)));

B= -7.918;               
C= -2.594;
D= 3.188;
E= 1.863;
Fx_MF_600 = 600*D*sin(C*atan((B*SR600-E*(B*SR600 - atan(B*SR600)))));

% 
% a= -6.269;          
% b= 1.819;
% c= 2.015;
% d= 0.054;
p= -6.602;          
q= 1.862;
r= 2.046;
w= 0.056;


Fx_exp_900 =900*(p*SR900+q+r*(1-2*exp(-SR900/w)));


B= 4.79;               
C= 3.608;
D= 2.66;
E= 3.135;
Fx_MF_900 = 900*D*sin(C*atan((B*SR900-E*(B*SR900 - atan(B*SR900)))));

p= -6.686;          
q= 1.95;
r= 1.991;
w= 0.073;

Fx_exp_1200=1200*(p*SR1200+q+r*(1-2*exp(-SR1200/w)));


B= -8.774;               
C= -1.037;
D= 4.142;
E= 1.58;
Fx_MF_1200 = 1200*D*sin(C*atan((B*SR1200-E*(B*SR1200 - atan(B*SR1200)))));


exp_error_600 = FX600 - Fx_exp_600;
exp_mse_600 = mse(exp_error_600);

MF_error_600 = FX600 - Fx_MF_600;
MF_mse_600 = mse(MF_error_600);

exp_error_900 = FX900 - Fx_exp_900;
exp_mse_900 = mse(exp_error_900);
MF_error_900 = FX900 - Fx_MF_900;
MF_mse_900 = mse(MF_error_900);

exp_error_1200 =FX1200 - Fx_exp_1200;
exp_mse_1200 = mse(exp_error_1200);
MF_error_1200 = FX1200 - Fx_MF_1200;
MF_mse_1200 = mse(MF_error_1200);



