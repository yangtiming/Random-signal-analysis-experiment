clear all
close all
clc
%%
%编程实现产生10000个N(3, 4) 高斯随机数。
 rng('shuffle');
    len = 10000;
    x = zeros(1,len);
    for i = 1 : len
       x(i) = gauss_rand(); 
    end
    x=2*x+3;
    figure
    hist(x,200);
    title('N(3,4)')
    %%
    %估计随机数的分布
    [f,xi]=ksdensity(x);
figure,subplot(2,1,1),plot(xi,f);
title('利用MATLAB函数ksdensity估计的概率密度')
%%
%对照预设的N（mn，a）高斯分布概率图
mn=3,a=2;
t=-6:1/100:12;
y=1/(sqrt(2*pi)*a)*exp(-(t-mn).^2/(2*a*a));
subplot(2,1,2),plot(t,y);
title('预设的N（mn，a）高斯分布理论概率图')

suptitle('自编代码生成数据概率图与理论概率比较')
    %%
  %计算生成随机数的1~4阶矩，最大值，最小值，频度直方图
  x1=zeros(1,4);
    
for i=1:10000
    x1(1)=x1(1)+x(i);
    x1(2)=x1(2)+x(i)^2;
    x1(3)=x1(3)+x(i)^3;
    x1(4)=x1(4)+x(i)^4;
end
x1=x1/10000
disp(['生成数据的数字特征'])
disp(['均值 = ',num2str(x1(1))] );
disp(['均方值 = ',num2str(x1(2))] );
disp(['三阶原点矩 = ',num2str(x1(3))] );
disp(['四阶原点矩 = ',num2str(x1(4))] );
figure
hist(x1,100)
Max=max(x)
Min=min(x)
%%
%验证均值和方差
meanValue = mean(x);
stdValue  = std(x);
disp('----------')
disp(['预设参数，均值为：',num2str(mn),',标准差为：',num2str(a)]);
disp(['计算参数，均值为：',num2str(meanValue),',标准差为：',num2str(stdValue)]);

meanErr = (meanValue - mn)/(mn)*100;
stdErr  = (stdValue - a)/(a)*100;

disp(['相对误差分别为：',num2str(meanErr),' %, 和：',num2str(stdErr),' %'])
disp('两者相近。从直方图和低阶矩上看，基本符合要求。')
%%
 function r = gauss_rand()
 
    n = 5;
    %rand(1,n)均匀产生100个0~1之间的随机数
    r = (sum(rand(1,n)) - n * 0.5) / sqrt(n / 12);
end