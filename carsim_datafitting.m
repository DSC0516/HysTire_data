clear;
clc;
load('carsim_mfdata.mat');  %试验数据 工作区
k = 2730;
s_test1=0:0.001:0.13;
a= -1.164;          
b= 0.564;
c= 0.641;
d= 0.043;
u_sim1 =(a*s_test1+b+c*(1-2*exp(-s_test1/d)));
a_m = 0.13;%最大值横坐标
a_b = 0.049;%第二段加载初点横坐标
a_o = 1;%横坐标最大值
Fa_m= a*a_m+b+c*(1-2*exp(-a_m/d));
Fa_b= a*a_b+b+c*(1-2*exp(-a_b/d));
f1 = (a_m-a_b)/(a_o-a_m);
s_test2=0.13:0.001:1;
u_sim2 = Fa_m+Fa_b-a*(a_b+f1*(s_test2-a_m))-b-c*(1-2*exp(-(a_b+f1*(s_test2-a_m))/d));
Fx_cau1_02=u_sim1*k;
Fx_cau2_02=u_sim2*k;
s1_02=s_test1;
s2_02=s_test2;
hold on;
plot(s,mf02,'--b','LineWidth',2);
hold on;
plot(s1_02,Fx_cau1_02,'r','LineWidth',2);
hold on;
plot(s2_02,Fx_cau2_02,'r','LineWidth',2);


k = 5460;
s_test1=0:0.001:0.13;
a= -1.809;          
b= 0.643;
c= 0.702;
d= 0.05;
u_sim1 =(a*s_test1+b+c*(1-2*exp(-s_test1/d)));
a_m = 0.13;%最大值横坐标
a_b = 0.05;%第二段加载初点横坐标
a_o = 1;%横坐标最大值
Fa_m= a*a_m+b+c*(1-2*exp(-a_m/d));
Fa_b= a*a_b+b+c*(1-2*exp(-a_b/d));
f1 = (a_m-a_b)/(a_o-a_m);
s_test2=0.13:0.001:1;
u_sim2 = Fa_m+Fa_b-a*(a_b+f1*(s_test2-a_m))-b-c*(1-2*exp(-(a_b+f1*(s_test2-a_m))/d));
Fx_cau1_04=u_sim1*k;
Fx_cau2_04=u_sim2*k;
s1_04=s_test1;
s2_04=s_test2;
hold on;
plot(s,mf04,'--b','LineWidth',2);
hold on;
plot(s1_04,Fx_cau1_04,'r','LineWidth',2);
hold on;
plot(s2_04,Fx_cau2_04,'r','LineWidth',2);


k = 8189;
s_test1=0:0.001:0.13;
a= -2.079;          
b= 0.677;
c= 0.728;
d= 0.053;
u_sim1 =(a*s_test1+b+c*(1-2*exp(-s_test1/d)));
a_m = 0.13;%最大值横坐标
a_b = 0.051;%第二段加载初点横坐标
a_o = 1;%横坐标最大值
Fa_m= a*a_m+b+c*(1-2*exp(-a_m/d));
Fa_b= a*a_b+b+c*(1-2*exp(-a_b/d));
f1 = (a_m-a_b)/(a_o-a_m);
s_test2=0.13:0.001:1;
u_sim2 = Fa_m+Fa_b-a*(a_b+f1*(s_test2-a_m))-b-c*(1-2*exp(-(a_b+f1*(s_test2-a_m))/d));
Fx_cau1_06=u_sim1*k;
Fx_cau2_06=u_sim2*k;
s1_06=s_test1;
s2_06=s_test2;
hold on;
plot(s,mf06,'--b','LineWidth',2);
hold on;
plot(s1_06,Fx_cau1_06,'r','LineWidth',2);
hold on;
plot(s2_06,Fx_cau2_06,'r','LineWidth',2);


k = 10920;
s_test1=0:0.001:0.13;
a= -1.878;          
b= 0.65;
c= 0.709;
d= 0.051;
u_sim1 =(a*s_test1+b+c*(1-2*exp(-s_test1/d)));
a_m = 0.13;%最大值横坐标
a_b = 0.051;%第二段加载初点横坐标
a_o = 1;%横坐标最大值
Fa_m= a*a_m+b+c*(1-2*exp(-a_m/d));
Fa_b= a*a_b+b+c*(1-2*exp(-a_b/d));
f1 = (a_m-a_b)/(a_o-a_m);
s_test2=0.13:0.001:1;
u_sim2 = Fa_m+Fa_b-a*(a_b+f1*(s_test2-a_m))-b-c*(1-2*exp(-(a_b+f1*(s_test2-a_m))/d));
Fx_cau1_08=u_sim1*k;
Fx_cau2_08=u_sim2*k;
s1_08=s_test1;
s2_08=s_test2;
hold on;
plot(s,mf08,'--b','LineWidth',2);
hold on;
plot(s1_08,Fx_cau1_08,'r','LineWidth',2);
hold on;
plot(s2_08,Fx_cau2_08,'r','LineWidth',2);
print -depsc C:\Users\86152\OneDrive\duan\OneDrive\Lasis\010-轮胎模型\HysTire\figure\newfigure\1

k = 13650;
s_test1=0:0.001:0.14;
a= -1.562;          
b= 0.611;
c= 0.677;
d= 0.048;
u_sim1 =(a*s_test1+b+c*(1-2*exp(-s_test1/d)));
a_m = 0.14;%最大值横坐标
a_b = 0.051;%第二段加载初点横坐标
a_o = 1;%横坐标最大值
Fa_m= a*a_m+b+c*(1-2*exp(-a_m/d));
Fa_b= a*a_b+b+c*(1-2*exp(-a_b/d));
f1 = (a_m-a_b)/(a_o-a_m);
s_test2=0.14:0.001:1;
u_sim2 = Fa_m+Fa_b-a*(a_b+f1*(s_test2-a_m))-b-c*(1-2*exp(-(a_b+f1*(s_test2-a_m))/d));
Fx_cau1_10=u_sim1*k;
Fx_cau2_10=u_sim2*k;
s1_10=s_test1;
s2_10=s_test2;
hold on;
h1=plot(s,mf10,'--b','LineWidth',2);
hold on;
h2=plot(s1_10,Fx_cau1_10,'r','LineWidth',2);
hold on;
plot(s2_10,Fx_cau2_10,'r','LineWidth',2);
axis([0 1 0 15000]);
legend([h1 h2],'MF','HysTire','location','northeast','box','off');
xlabel('Slip ratio{\it s} (-)');
ylabel('Longitudinal force{\it F_x} (N)');
set(gca,'XTick',[0:0.2:1]);
set(gca,'YTick',[0:3000:15000]);
