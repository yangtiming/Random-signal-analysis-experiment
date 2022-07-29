clc;
clear all;
close all;
%%
%编程实现产生10000个N(1, 2) 高斯随机数。
 rng('shuffle');
    len = 10000;
    x = zeros(1,len);
    for i = 1 : len
       x(i) = gauss_rand(); 
    end
    x=sqrt(2)*x+1;
   
    n1=xcorr_my(x);
    m=-len:len-1;
    subplot(511);plot(m,n1)
    title('傅立叶变换求N(1,2)自相关函数');
    [zxg1,n1]=xcorr(x,'coeff');
    subplot(512);plot(n1,zxg1)
    title('matlab自带函数求N(1,2)自相关函数');
  %  [~,indx]=max(n1);
  % title(['最大值点位于',num2str(abs(indx-len))]);
  %%
  %编程实现产生10000个N(3, 4) 高斯随机数。
 rng('shuffle');
    len = 10000;
    y = zeros(1,len);
    for i = 1 : len
       y(i) = gauss_rand(); 
    end
    y=2*y+3;
    n2=xcorr_my(y);
    m=-len:len-1;
    subplot(513);plot(m,n2)
    title('傅立叶变换求N(3,4)自相关函数');
    [zxg2,n2]=xcorr(y,'coeff');
    subplot(514);plot(n2,zxg2)
    title('matlab自带函数求N(3,4)自相关函数');
   % [~,indx]=max(n2);
   % title(['最大值点位于',num2str(abs(indx-len))]);
  %%
  %计算互相关函数
 [a,b]= xcorr(x,y,'coeff');
  subplot(515);plot(b,a) 
  title('互相关函数');
  %%
 function r = gauss_rand()
    n = 5;
    %rand(1,n)均匀产生10000个0~1之间的随机数
    r = (sum(rand(1,n)) - n * 0.5) / sqrt(n / 12);
 end
 
 %%
function Rx=xcorr_my(xn)
%互相关函数
    N=10000;
    Xk=fft(xn,2*N);
    Rx=fftshift(ifft((abs(Xk).^2)/N));

 end