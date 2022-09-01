clear;
clc;
load('carsim_mfdata.mat');  %试验数据 工作区
k = 2730;
s_test1=0:0.001:0.13;
p= -1.164;          
q= 0.564;
r= 0.641;
w= 0.043;
u_sim1 =(p*s_test1+q+r*(1-2*exp(-s_test1/w)));
a_m = 0.13;%最大值横坐标
a_b = 0.049;%第二段加载初点横坐标
a_o = 1;%横坐标最大值
Fa_m= p*a_m+q+r*(1-2*exp(-a_m/w));
Fa_b= p*a_b+q+r*(1-2*exp(-a_b/w));
f1 = (a_m-a_b)/(a_o-a_m);
s_test2=0.13:0.001:1;
u_sim2 = Fa_m+Fa_b-p*(a_b+f1*(s_test2-a_m))-q-r*(1-2*exp(-(a_b+f1*(s_test2-a_m))/w));
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
p= -1.809;          
q= 0.643;
r= 0.702;
w= 0.05;
u_sim1 =(p*s_test1+q+r*(1-2*exp(-s_test1/w)));
a_m = 0.13;%最大值横坐标
a_b = 0.05;%第二段加载初点横坐标
a_o = 1;%横坐标最大值
Fa_m= p*a_m+q+r*(1-2*exp(-a_m/w));
Fa_b= p*a_b+q+r*(1-2*exp(-a_b/w));
f1 = (a_m-a_b)/(a_o-a_m);
s_test2=0.13:0.001:1;
u_sim2 = Fa_m+Fa_b-p*(a_b+f1*(s_test2-a_m))-q-r*(1-2*exp(-(a_b+f1*(s_test2-a_m))/w));
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
p= -2.079;          
q= 0.677;
r= 0.728;
w= 0.053;
u_sim1 =(p*s_test1+q+r*(1-2*exp(-s_test1/w)));
a_m = 0.13;%最大值横坐标
a_b = 0.051;%第二段加载初点横坐标
a_o = 1;%横坐标最大值
Fa_m= p*a_m+q+r*(1-2*exp(-a_m/w));
Fa_b= p*a_b+q+r*(1-2*exp(-a_b/w));
f1 = (a_m-a_b)/(a_o-a_m);
s_test2=0.13:0.001:1;
u_sim2 = Fa_m+Fa_b-p*(a_b+f1*(s_test2-a_m))-q-r*(1-2*exp(-(a_b+f1*(s_test2-a_m))/w));
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
p= -1.878;          
q= 0.65;
r= 0.709;
w= 0.051;
u_sim1 =(p*s_test1+q+r*(1-2*exp(-s_test1/w)));
a_m = 0.13;%最大值横坐标
a_b = 0.051;%第二段加载初点横坐标
a_o = 1;%横坐标最大值
Fa_m= p*a_m+q+r*(1-2*exp(-a_m/w));
Fa_b= p*a_b+q+r*(1-2*exp(-a_b/w));
f1 = (a_m-a_b)/(a_o-a_m);
s_test2=0.13:0.001:1;
u_sim2 = Fa_m+Fa_b-p*(a_b+f1*(s_test2-a_m))-q-r*(1-2*exp(-(a_b+f1*(s_test2-a_m))/w));
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
p= -1.562;          
q= 0.611;
r= 0.677;
w= 0.048;
u_sim1 =(p*s_test1+q+r*(1-2*exp(-s_test1/w)));
a_m = 0.14;%最大值横坐标
a_b = 0.051;%第二段加载初点横坐标
a_o = 1;%横坐标最大值
Fa_m= p*a_m+q+r*(1-2*exp(-a_m/w));
Fa_b= p*a_b+q+r*(1-2*exp(-a_b/w));
f1 = (a_m-a_b)/(a_o-a_m);
s_test2=0.14:0.001:1;
u_sim2 = Fa_m+Fa_b-p*(a_b+f1*(s_test2-a_m))-q-r*(1-2*exp(-(a_b+f1*(s_test2-a_m))/w));
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
