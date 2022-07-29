%% task1_4
%% ���û���
clc;
clear all;
close all;

%%
%�����ļ�����ʾ
[y1,Fs1] = audioread('201883016_����1.wav');
[y2,Fs2] = audioread('201883016_����2.wav');
%%
N1=length(y1);
N2=length(y2);

t1=(0:N1-1)/Fs1;
t2=(0:N2-1)/Fs2;
subplot(2,1,1);plot(t1,y1)
title('����1');
hold on
subplot(2,1,2);plot(t2,y2)
title('����2')


%%
[hxg,n]=xcorr(y1,y2,'coeff');
figure
plot(n,hxg)
title('����غ���');
%% ��������ط�ֵ���ӳٵ���
%�����ӳ�ʱ��
[mx,indx] = max (hxg);

TLag = abs(N1 - indx);
disp(['��������غ����������ӳٵ���Ϊ��',num2str(TLag/Fs1),'���߱�ʾΪ',num2str(TLag),'��'])
%% �Ŵ�ʱ��߶�
%[hxg,lags]=xcorr(y1,y2,N1-indx-2000);
%figure;plot(lags,hxg)
%title('�Ŵ�ʱ��߶ȵĻ����')
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
disp(['�������ݵ���������'])
disp(['��ֵ = ',num2str(m(1))] );
disp(['����ֵ = ',num2str(m(2))] );
disp(['����ԭ��� = ',num2str(m(3))] );
disp(['�Ľ�ԭ��� = ',num2str(m(4))] );
%%
%�ж���������
figure
hist((y2(1:TLag)+0.8)/1.6)
title('����ֱ��ͼ')
disp(['������ֱ��ͼ�ɵ�Ϊ��(-0.8,0.8)֮���������ȷֲ�'])
disp(['------------'])
%�������
%�������ȹ�һ��
normal_ =( y2(1:TLag)+0.8)/1.6;
[h,p,s] = chi2gof(normal_,'cdf',@unifcdf)
if(h==0)
    disp(['�ɺ���������������Ŷ�chi2gof����֪������������������ȷֲ�'])
end