
% select函数（选择）

function ret=select(individuals,popsize)
% 该函数用于进行选择操作
% individuals input    种群信息
% sizepop     input    种群规模
% ret         output   选择后的新种群
%求适应度值倒数  
fitness1=10./individuals.fitness; %individuals.fitness为个体适应度值
%个体选择概率
sumfitness=sum(fitness1);
sumf=fitness1./sumfitness;
%采用轮盘赌法选择新个体
index=[];
for i=1:popsize   %popsize为种群数
    pick=rand;
%     while pick==0   
%         pick=rand;       
%     end
    for j=1:popsize   
        pick=pick-sumf(j);       
        if pick<0                  
            index=[index j];           
            break; 
        end
    end
end
%新种群
individuals.chrom=individuals.chrom(index,:);   %individuals.chrom为种群中个体
individuals.fitness=individuals.fitness(index);

ret=individuals;