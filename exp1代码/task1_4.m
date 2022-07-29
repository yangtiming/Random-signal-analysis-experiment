%% task1_4
%% 配置环境
clc;
clear all;
close all;

%%
%输入文件并显示
[y1,Fs1] = audioread('201883016_采样1.wav');
[y2,Fs2] = audioread('201883016_采样2.wav');
%%
N1=length(y1);
N2=length(y2);

t1=(0:N1-1)/Fs1;
t2=(0:N2-1)/Fs2;
subplot(2,1,1);plot(t1,y1)
title('采样1');
hold on
subplot(2,1,2);plot(t2,y2)
title('采样2')


%%
[hxg,n]=xcorr(y1,y2,'coeff');
figure
plot(n,hxg)
title('互相关函数');
%% 搜索互相关峰值得延迟点数
%计算延迟时间
[mx,indx] = max (hxg);

TLag = abs(N1 - indx);
disp(['经计算相关函数，估计延迟点数为：',num2str(TLag/Fs1),'或者表示为',num2str(TLag),'。'])
%% 放大时间尺度
%[hxg,lags]=xcorr(y1,y2,N1-indx-2000);
%figure;plot(lags,hxg)
%title('放大时间尺度的互相关')
%%


m = zeros(1,4);        
for i = 1 : TLag
    m(1) = m(1) + y2(i);   
    m(2) = m(2) + y2(i)^2;  
    m(3) = m(3) + y2(i)^3;  
    m(4) = m(4) + y2(i)^4;  
end
m=m/TLag;
disp(['------------'])
disp(['生成数据的数字特征'])
disp(['均值 = ',num2str(m(1))] );
disp(['均方值 = ',num2str(m(2))] );
disp(['三阶原点矩 = ',num2str(m(3))] );
disp(['四阶原点矩 = ',num2str(m(4))] );
%%
%判断噪声类型
figure
hist((y2(1:TLag)+0.8)/1.6)
title('噪声直方图')
disp(['噪声由直方图可得为：(-0.8,0.8)之间的随机均匀分布'])
disp(['------------'])
%假设检验
%将噪声先归一化
normal_ =( y2(1:TLag)+0.8)/1.6;
[h,p,s] = chi2gof(normal_,'cdf',@unifcdf)
if(h==0)
    disp(['由函数卡方检验拟合优度chi2gof可以知道，噪声服从随机均匀分布'])
end