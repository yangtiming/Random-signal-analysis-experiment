
clear all
close all
clc

%为保证 s(n)的周期为 M，r 的取值应满足
 %r = 4k + 1，M ^ 2p 
 %k 与 p 的选取应满足:r < M，r(M-1) + 1< 231-1
 %通常公式中参数常用取值为 s(0) =12357，r = 2045，b = 1，M =1048576。
 
 %(1) 编程实现产生10000个在(0, 1)区间均匀分布随机数。
 
 M =1048576;
 b = 1;
 r = 2045;
 s=zeros(1,10000);
 s(1)=12357;
 
for i=2:10000
    s(i)=mod(s(i-1)*r+b,M);
end
 s=s/M;

 %计算生成随机数的1~4阶矩，最大值，最小值，频度直方图。 
 x=zeros(1,4);
for i=1:10000
    x(1)=x(1)+s(i);
    x(2)=x(2)+s(i)^2;
    x(3)=x(3)+s(i)^3;
    x(4)=x(4)+s(i)^4;
end
x=x/10000;
disp(['生成数据的数字特征'])
disp(['均值 = ',num2str(x(1))] );
disp(['均方值 = ',num2str(x(2))] );
disp(['三阶原点矩 = ',num2str(x(3))] );
disp(['四阶原点矩 = ',num2str(x(4))] );
%频度直方图


% 画线和画点
% 画线
figure,plot(s)  %全部
title('全部数据连线')
figure,plot(s(1:100)) %前100个数据
title('前100个数据连线')
% 画点
figure,plot(s,'.')  %全部
title('全部数据画点')
figure,plot(s(1:100),'*') %前100个数据
title('前100个数据画点')


figure
hist(s,20)
title('随机数的直方图')
Max=max(s)
Min=min(s)
%%
%估计随机数的分布
[f,xi]=ksdensity(s);
figure,plot(xi,f);
title('利用MATLAB函数ksdensity估计的概率密度')
suptitle('MATLAB内置函数生成数据展示')


    

    
    
    

