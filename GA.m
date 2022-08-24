%% GA
clc
clear
% (1)Initialization of population
% 1.1 初始参数列表
Nind = 20;                                                          % 种群规模
Lind = 4;                                                          % 染色体个数
maxGen = 1000;                                                       % 进化次数（迭代次数）
Pc = 0.8;                                                           % 交叉概率
Pm = 0.2;                                                          % 变异概率
Xmin = [-1,-5,0,0];         % 下界
Xmax = [5,5,5,5];           % 上界

% 1.2 初始化个体
individuals = struct('fitness', zeros(Nind, 1), 'chrom', []);       % 种群结构体
avg_Fit = [];           % 平均适应度
best_fit = [];          % 最佳适应度
best_chrom = [];        % 最佳适应度对应的个体

% 1.3 初始化种群
for i = 1:Nind
    individuals.chrom(i,:) = rand(1, Lind).*(Xmax - Xmin)+Xmin;     % 随机产生染色体
    temp = individuals.chrom(i,:);
    individuals.fitness(i) = -1*obj_fun(temp);                      % 计算适应度
end
best_chrom = [];                                                    % 历代最优个体
avg_Fit = [];                                                       % 历代适应度平均值
trace = [];                                                         % 历代最优适应度

% (2)开始迭代
for gen = 1:maxGen
    % 计算适应度
    for i = 1:Nind
        temp = individuals.chrom(i,:);
        individuals.fitness(i) = -1*obj_fun(temp);                  % 计算适应度
    end
    
    % 找出最优适应度及其对应的个体
    [best_fit best_index] = max(individuals.fitness);
    best_chrom = [best_chrom;individuals.chrom(best_index,:)];
    avg_Fit = [avg_Fit; mean(individuals.fitness)];
    trace = [trace;best_fit];
    
    % 选择算子
    individuals = Select(individuals,Nind);
    
    % 交叉操作
    individuals = Cross(individuals,Pc,Nind,Lind);
    
    % 变异操作
    individuals = Mutation(individuals,Pm,Nind,Lind,Xmax,Xmin);
end
trace = -trace;
avg_Fit = -avg_Fit;
x=best_chrom(find(trace == min(trace)),:)
clc
disp(['最优适应度为：',num2str(trace(end))])
disp('对应的种群为：')
disp(x)
plot(trace, 'LineWidth', 1)
title(['适应度进化曲线（最大迭代次数maxGen=',num2str(maxGen),'）'])
xlabel('进化次数')
ylabel('适应度')
hold on
legend('历代最佳适应度')
function new_individuals = Select(individuals, Nind)
% select 选择算子，基于随机联赛策略选择较优的个体
% individuals        input:     种群
% Nind               input:     种群规模
% new_chrom          output:    经选择算子生成的新种群

N = 2;          % 每次随机选择的个体数
index = [];     % 存储每次选择的个体的索引
for i = 1:Nind
    race_indi_index = randi(Nind, [2,1]);       % 被选中的个体的索引
    race_indi_fit = individuals.fitness(race_indi_index);   % 被选中的个体的适应度
    bigger_index = find(individuals.fitness == max(race_indi_fit));
    index = [index; bigger_index(1)];
end
individuals.chrom = individuals.chrom(index,:);
individuals.fitness = individuals.fitness(index,:);
new_individuals = individuals;

end
function new_individuals = Cross(individuals, Pc, Nind, Lind)
% Cross 使用模拟二进制交叉算子(SBX)，随机选择两个个体进行染色体的交叉
% individuals           input:      种群
% Pc                    input:      交叉概率
% Nind                  input:      种群规模
% Lind                  input:      染色体长度
% new_individuals       output:     经交叉操作后产生的新种群

new_individuals = individuals;
for i = 1:Nind
    % 随机选择两个个体
    index = randi(Nind, [2,1]);
    cross_indi = individuals.chrom(index, :);
    temp = zeros(2, Lind);
    
    % 进行交叉操作
    for j = 1:Lind
        Pick = rand;
        if Pick < Pc
            eta = 0.5;          % 分布因子
            % 分布因子越大，其产生的后代个体逼近父代个体的概率越大，故SBX算子在局部搜索上表现较强
            u = rand;
            if u <= 0.5
                beta = (2*u)^(1/(1+eta));
            else
                beta = (2*(1-u))^(1/(1+eta));
            end
            
            % 交叉
            temp(1,j) = 0.5*((1+beta)*individuals.chrom(index(1),j) + (1-beta)*individuals.chrom(index(2),j));
            temp(2,j) = 0.5*((1-beta)*individuals.chrom(index(1),j) + (1+beta)*individuals.chrom(index(2),j));
        else
            temp(1,j) = individuals.chrom(index(1),j);
            temp(2,j) = individuals.chrom(index(2),j);
        end
    end
    new_individuals.chrom(index(1),:) = temp(1,:);
    new_individuals.chrom(index(2),:) = temp(2,:);
end

end
function new_individuals = Mutation(individuals, Pm, Nind, Lind, Xmax, Xmin)
% Mutation 对种群中每个个体，使用高斯变异算子，随机选取一点进行变异
% individuals           input:      种群
% Pm                    input:      变异概率
% Nind                  input:      种群规模
% Lind                  input:      染色体长度
% Xmax                  input:      自变量的上界
% Xmin                  input:      自变量的下界
% new_individuals       output:     经交叉操作后产生的新种群

new_individuals = individuals;
for i = 1:Nind
    for j = 1:Lind
        Pick = rand;
        if Pick < Pm
            u = (Xmax(j)+Xmin(j))/2;
            sigma = (Xmax(j)-Xmin(j))/6;
            new_individuals.chrom(i,j) = u+sigma*(sum(rand([1,12]))-6); 
        end
    end
end

end
function fitness = obj_fun(V)
% OBJ_FUN 计算染色体序列Chrom对应的染色度
% V        input:   染色体序列
% fitness      output:  适应度
load('Fy_testdata.mat'); 

u_test1=Mz_400/20;
s_test1=SA_400; 


B= V(1);               %待辨识参数
C= V(2);
D= V(3);
E= V(4);

u_sim1 = D*sin(C*atan((B*s_test1-E*(B*s_test1 - atan(B*s_test1)))));


fitness=sum((u_test1-u_sim1).^2);
end

