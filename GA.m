%% GA
clc
clear
% (1)Initialization of population
% 1.1 ��ʼ�����б�
Nind = 20;                                                          % ��Ⱥ��ģ
Lind = 4;                                                          % Ⱦɫ�����
maxGen = 1000;                                                       % ��������������������
Pc = 0.8;                                                           % �������
Pm = 0.2;                                                          % �������
Xmin = [-1,-5,0,0];         % �½�
Xmax = [5,5,5,5];           % �Ͻ�

% 1.2 ��ʼ������
individuals = struct('fitness', zeros(Nind, 1), 'chrom', []);       % ��Ⱥ�ṹ��
avg_Fit = [];           % ƽ����Ӧ��
best_fit = [];          % �����Ӧ��
best_chrom = [];        % �����Ӧ�ȶ�Ӧ�ĸ���

% 1.3 ��ʼ����Ⱥ
for i = 1:Nind
    individuals.chrom(i,:) = rand(1, Lind).*(Xmax - Xmin)+Xmin;     % �������Ⱦɫ��
    temp = individuals.chrom(i,:);
    individuals.fitness(i) = -1*obj_fun(temp);                      % ������Ӧ��
end
best_chrom = [];                                                    % �������Ÿ���
avg_Fit = [];                                                       % ������Ӧ��ƽ��ֵ
trace = [];                                                         % ����������Ӧ��

% (2)��ʼ����
for gen = 1:maxGen
    % ������Ӧ��
    for i = 1:Nind
        temp = individuals.chrom(i,:);
        individuals.fitness(i) = -1*obj_fun(temp);                  % ������Ӧ��
    end
    
    % �ҳ�������Ӧ�ȼ����Ӧ�ĸ���
    [best_fit best_index] = max(individuals.fitness);
    best_chrom = [best_chrom;individuals.chrom(best_index,:)];
    avg_Fit = [avg_Fit; mean(individuals.fitness)];
    trace = [trace;best_fit];
    
    % ѡ������
    individuals = Select(individuals,Nind);
    
    % �������
    individuals = Cross(individuals,Pc,Nind,Lind);
    
    % �������
    individuals = Mutation(individuals,Pm,Nind,Lind,Xmax,Xmin);
end
trace = -trace;
avg_Fit = -avg_Fit;
x=best_chrom(find(trace == min(trace)),:)
clc
disp(['������Ӧ��Ϊ��',num2str(trace(end))])
disp('��Ӧ����ȺΪ��')
disp(x)
plot(trace, 'LineWidth', 1)
title(['��Ӧ�Ƚ������ߣ�����������maxGen=',num2str(maxGen),'��'])
xlabel('��������')
ylabel('��Ӧ��')
hold on
legend('���������Ӧ��')
function new_individuals = Select(individuals, Nind)
% select ѡ�����ӣ����������������ѡ����ŵĸ���
% individuals        input:     ��Ⱥ
% Nind               input:     ��Ⱥ��ģ
% new_chrom          output:    ��ѡ���������ɵ�����Ⱥ

N = 2;          % ÿ�����ѡ��ĸ�����
index = [];     % �洢ÿ��ѡ��ĸ��������
for i = 1:Nind
    race_indi_index = randi(Nind, [2,1]);       % ��ѡ�еĸ��������
    race_indi_fit = individuals.fitness(race_indi_index);   % ��ѡ�еĸ������Ӧ��
    bigger_index = find(individuals.fitness == max(race_indi_fit));
    index = [index; bigger_index(1)];
end
individuals.chrom = individuals.chrom(index,:);
individuals.fitness = individuals.fitness(index,:);
new_individuals = individuals;

end
function new_individuals = Cross(individuals, Pc, Nind, Lind)
% Cross ʹ��ģ������ƽ�������(SBX)�����ѡ�������������Ⱦɫ��Ľ���
% individuals           input:      ��Ⱥ
% Pc                    input:      �������
% Nind                  input:      ��Ⱥ��ģ
% Lind                  input:      Ⱦɫ�峤��
% new_individuals       output:     ��������������������Ⱥ

new_individuals = individuals;
for i = 1:Nind
    % ���ѡ����������
    index = randi(Nind, [2,1]);
    cross_indi = individuals.chrom(index, :);
    temp = zeros(2, Lind);
    
    % ���н������
    for j = 1:Lind
        Pick = rand;
        if Pick < Pc
            eta = 0.5;          % �ֲ�����
            % �ֲ�����Խ��������ĺ������ƽ���������ĸ���Խ�󣬹�SBX�����ھֲ������ϱ��ֽ�ǿ
            u = rand;
            if u <= 0.5
                beta = (2*u)^(1/(1+eta));
            else
                beta = (2*(1-u))^(1/(1+eta));
            end
            
            % ����
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
% Mutation ����Ⱥ��ÿ�����壬ʹ�ø�˹�������ӣ����ѡȡһ����б���
% individuals           input:      ��Ⱥ
% Pm                    input:      �������
% Nind                  input:      ��Ⱥ��ģ
% Lind                  input:      Ⱦɫ�峤��
% Xmax                  input:      �Ա������Ͻ�
% Xmin                  input:      �Ա������½�
% new_individuals       output:     ��������������������Ⱥ

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
% OBJ_FUN ����Ⱦɫ������Chrom��Ӧ��Ⱦɫ��
% V        input:   Ⱦɫ������
% fitness      output:  ��Ӧ��
load('Fy_testdata.mat'); 

u_test1=Mz_400/20;
s_test1=SA_400; 


B= V(1);               %����ʶ����
C= V(2);
D= V(3);
E= V(4);

u_sim1 = D*sin(C*atan((B*s_test1-E*(B*s_test1 - atan(B*s_test1)))));


fitness=sum((u_test1-u_sim1).^2);
end

