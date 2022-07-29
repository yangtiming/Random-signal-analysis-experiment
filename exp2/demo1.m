function varargout = demo1(varargin)
% DEMO1 MATLAB code for demo1.fig
%      DEMO1, by itself, creates a new DEMO1 or raises the existing
%      singleton*.
%
%      H = DEMO1 returns the handle to a new DEMO1 or the handle to
%      the existing singleton*.
%
%      DEMO1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO1.M with the given input arguments.
%
%      DEMO1('Property','Value',...) creates a new DEMO1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demo1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demo1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demo1

% Last Modified by GUIDE v2.5 09-May-2020 16:40:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demo1_OpeningFcn, ...
                   'gui_OutputFcn',  @demo1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before demo1 is made visible.
function demo1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demo1 (see VARARGIN)

% Choose default command line output for demo1
handles.output = hObject;
handles.pb0=[];


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demo1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = demo1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pb1.
function pb1_Callback(hObject, eventdata, handles)
% hObject    handle to pb1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % 每个数字 410 个采样点表示
d=sin(2*pi*697*n/8192)+sin(2*pi*1209*n/8192); % 对应行频列频叠加
space = zeros(1,410);%410个0模拟静音
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'1'); % 获取数字号码 
set(handles.numshow,'string',newnum); % 显示号码 
sound(d,8192); % 产生拨号音
guidata(hObject,handles);



% --- Executes on button press in pb2.
function pb2_Callback(hObject, eventdata, handles)
% hObject    handle to pb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % 每个数字 410 个采样点表示
d=sin(2*pi*697*n/8192)+sin(2*pi*1336*n/8192); % 对应行频列频叠加
space = zeros(1,410);%410个0模拟静音
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'2'); % 获取数字号码 
set(handles.numshow,'string',newnum); % 显示号码 
sound(d,8192); % 产生拨号音
guidata(hObject,handles);


% --- Executes on button press in pb3.
function pb3_Callback(hObject, eventdata, handles)
% hObject    handle to pb3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % 每个数字 410 个采样点表示
d=sin(2*pi*697*n/8192)+sin(2*pi*1477*n/8192); % 对应行频列频叠加
space = zeros(1,410);%410个0模拟静音
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'3'); % 获取数字号码 
set(handles.numshow,'string',newnum); % 显示号码 
sound(d,8192); % 产生拨号音
guidata(hObject,handles);

% --- Executes on button press in pb4.
function pb4_Callback(hObject, eventdata, handles)
% hObject    handle to pb4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % 每个数字 410 个采样点表示
d=sin(2*pi*770*n/8192)+sin(2*pi*1209*n/8192); % 对应行频列频叠加
space = zeros(1,410);%410个0模拟静音
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'4'); % 获取数字号码 
set(handles.numshow,'string',newnum); % 显示号码 
sound(d,8192); % 产生拨号音
guidata(hObject,handles);

% --- Executes on button press in pb5.
function pb5_Callback(hObject, eventdata, handles)
% hObject    handle to pb5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % 每个数字 410 个采样点表示
d=sin(2*pi*770*n/8192)+sin(2*pi*1336*n/8192); % 对应行频列频叠加
space = zeros(1,410);%410个0模拟静音
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'5'); % 获取数字号码 
set(handles.numshow,'string',newnum); % 显示号码 
sound(d,8192); % 产生拨号音
guidata(hObject,handles);

% --- Executes on button press in pb6.
function pb6_Callback(hObject, eventdata, handles)
% hObject    handle to pb6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % 每个数字 410 个采样点表示
d=sin(2*pi*770*n/8192)+sin(2*pi*1477*n/8192); % 对应行频列频叠加
space = zeros(1,410);%410个0模拟静音
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'6'); % 获取数字号码 
set(handles.numshow,'string',newnum); % 显示号码 
sound(d,8192); % 产生拨号音
guidata(hObject,handles);

% --- Executes on button press in pb7.
function pb7_Callback(hObject, eventdata, handles)
% hObject    handle to pb7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % 每个数字 410 个采样点表示
d=sin(2*pi*852*n/8192)+sin(2*pi*1209*n/8192); % 对应行频列频叠加
space = zeros(1,410);%410个0模拟静音
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'7'); % 获取数字号码 
set(handles.numshow,'string',newnum); % 显示号码 
sound(d,8192); % 产生拨号音
guidata(hObject,handles);


% --- Executes on button press in pb8.
function pb8_Callback(hObject, eventdata, handles)
% hObject    handle to pb8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % 每个数字 410 个采样点表示
d=sin(2*pi*852*n/8192)+sin(2*pi*1336*n/8192); % 对应行频列频叠加
space = zeros(1,410);%410个0模拟静音
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'8'); % 获取数字号码 
set(handles.numshow,'string',newnum); % 显示号码 
sound(d,8192); % 产生拨号音
guidata(hObject,handles);

% --- Executes on button press in pb9.
function pb9_Callback(hObject, eventdata, handles)
% hObject    handle to pb9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % 每个数字 410 个采样点表示
d=sin(2*pi*852*n/8192)+sin(2*pi*1477*n/8192); % 对应行频列频叠加
space = zeros(1,410);%410个0模拟静音
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'9'); % 获取数字号码 
set(handles.numshow,'string',newnum); % 显示号码 
sound(d,8192); % 产生拨号音
guidata(hObject,handles);

% --- Executes on button press in pb10.
function pb10_Callback(hObject, eventdata, handles)
% hObject    handle to pb10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % 每个数字 410 个采样点表示
d=sin(2*pi*941*n/8192)+sin(2*pi*1209*n/8192); % 对应行频列频叠加
space = zeros(1,410);%410个0模拟静音
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'*'); % 获取数字号码 
set(handles.numshow,'string',newnum); % 显示号码 
sound(d,8192); % 产生拨号音
guidata(hObject,handles);

% --- Executes on button press in pb0.
function pb0_Callback(hObject, eventdata, handles)
% hObject    handle to pb0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % 每个数字 410 个采样点表示
d=sin(2*pi*941*n/8192)+sin(2*pi*1336*n/8192); % 对应行频列频叠加
space = zeros(1,410);%410个0模拟静音
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'0'); % 获取数字号码 
set(handles.numshow,'string',newnum); % 显示号码 
sound(d,8192); % 产生拨号音
guidata(hObject,handles);

% --- Executes on button press in pb12.
function pb12_Callback(hObject, eventdata, handles)
% hObject    handle to pb12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

n=[1:410]; % 每个数字 410 个采样点表示
d=sin(2*pi*941*n/8192)+sin(2*pi*1477*n/8192); % 对应行频列频叠加
space = zeros(1,410);%410个0模拟静音
phone=[d,space];
handles.pb0=[handles.pb0,phone];
newnum=strcat(get(handles.numshow,'string'),'#'); % 获取数字号码 

set(handles.numshow,'string',newnum); % 显示号码 

sound(d,8192); % 产生拨号音
guidata(hObject,handles);


% --- Executes on button press in pbf.
function pbf_Callback(hObject, eventdata, handles)
% hObject    handle to pbf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

num = get(handles.numshow,'string');% 获取已经按下的数字号码 
L   = length(num);%计算以及按了几个号码
nll = strrep(num,num,num(1:L-1));%取出前L-1个号码
set(handles.numshow,'string',nll); % 重新显示

clear num(L);

n   = [1:410];
dll = sin(0.7217*n)+sin(0.9273*n);
sound(dll,8192);%删除按键的播放按钮声音
guidata(hObject,handles);

% --- Executes on button press in pbs.
function pbs_Callback(hObject, eventdata, handles)
% hObject    handle to pbs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[pyrrr,fs]=audioread(handles.filenames);%声音读取
pyrr=2.1*pyrrr;
L=length(pyrr)        %计算音频信号的长度
noise=1*randn(L,1);  %产生等长度的随机噪声信号(这里的噪声的大小取决于随机函数的幅度倍数）
pyr=pyrr+noise;        %将两个信号叠加成一个新的信号——加噪声处理   
sound(pyr,fs);   %声音回放
N=length(pyr); %信号的长度
figure(2),plot(pyr); %音频信号时域图
%设计IIR低通滤波器

snr=SNR(pyrr,pyr)
rp = 1;

rs=60;

Ft=fs;

Fp=2000;

Fs=4000;                                        

 

wp=2*pi*Fp/Ft;

ws = 2*pi*Fs/Ft ;   %求出待设计的模拟滤波器的边界频率

 

[N,wn]=buttord(wp,ws,rp,rs,'s');    %低通滤波器的阶数和截止频率

[b,a]=butter(N,wn,'s');             %S域频率响应的参数即：滤波器的传输函数

[bz,az]=bilinear(b,a,0.5);          %利用双线性变换实现频率响应S域到Z域的变换


%低通滤波器特性

[h,w]=freqz(bz,az);
%滤波

pyr=filter(bz,az,pyr);



figure(3),plot(pyr);

 N=length(pyr); %信号的长度
cattch=[];
i=1;

while(i<N-10)
        i=i+1;
    if((max([pyr(i),pyr(i+1),pyr(i+2),pyr(i+3),pyr(i+4),pyr(i+5),pyr(i+6),pyr(i+7),pyr(i+8)])>2) && i>420)
        cattch=[cattch,i];
        i=i+5000;
    end

end
N1=length(cattch);

newnum=[];
cap=['1','2','3';'4','5','6';'7','8','9';'*','0','#'];

for (k=1:N1)
    sdf=pyr(cattch(k)-410:cattch(k)+410);
    f=fft(sdf,fs);%作FFT变换 d是取出来每位拨号音的采样点
    a=abs(f);
    p=a.*a/fs; % 计算功率谱
    num(1)=find(p(1:1000)==max(p(1:1000))); % 找行频 
    num(2)=1000+find(p(1000:1700)==max(p(1000:1700))); % 找列频
    if (num(1) < 730)
        row=1; % 确定行数
    elseif (num(1) < 810)
        row=2;
    elseif (num(1) < 900)
        row=3;
    else  
        row=4;
    end

    if (num(2) < 1270)
        col=1; % 确定列数
    elseif (num(2) < 1400)
        col=2;
    else
        col=3; 
    end
     fprintf("%d\n",num(1),num(2));
    newnum=strcat(newnum,cap(row,col));
end
set(handles.text3,'string',newnum);
guidata(hObject,handles);


% --- Executes on button press in add.
function add_Callback(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[filename,pathname,Filterinfdex]= uigetfile('.wav');
handles.filenames= strcat(pathname,filename);
guidata(hObject,handles);


% --- Executes on button press in comsb.
function comsb_Callback(hObject, eventdata, handles)
% hObject    handle to comsb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


N=length(handles.pb0);
count=N/820;%计算出发了多少个数字
newnum=[];
cap=['1','2','3';'4','5','6';'7','8','9';'*','0','#'];
for i=1:count%一共 count 个数字
    d=handles.pb0(1+820*(i-1):820*i);%取每一位拨号音的采样点
    f=fft(d,8192);%作FFT变换 d是取出来每位拨号音的采样点
    a=abs(f);
    p=a.*a/8192; % 计算功率谱
    num(1)=find(p(1:1000)==max(p(1:1000))); % 找行频 
    num(2)=1000+find(p(1000:1700)==max(p(1000:1700))); % 找列频
    if (num(1) < 730)
        row=1; % 确定行数
    elseif (num(1) < 810)
        row=2;
    elseif (num(1) < 900)
        row=3;
    else  
        row=4;
    end

    if (num(2) < 1270)
        col=1; % 确定列数
    elseif (num(2) < 1400)
        col=2;
    else
        col=3; 
    end
     fprintf("%d\n",num(1),num(2));
    newnum=strcat(newnum,cap(row,col));
end
set(handles.text3,'string',newnum);
guidata(hObject,handles);

function snr=SNR(I,In)
% 计算信号噪声比函数
% I :original signal
% In:noisy signal(ie. Original signal + noise signal)
% snr=10*log10(sigma2(I2)/sigma2(I2-I1))

[row,col,nchannel]=size(I);

snr=0;
if nchannel==1%gray image
Ps=sum(sum((I-mean(mean(I))).^2));%signal power
Pn=sum(sum((I-In).^2));%noise power
snr=abs(10*log10(Ps/Pn));
elseif nchannel==3%color image
for i=1:3
Ps=sum(sum((I(:,:,i)-mean(mean(I(:,:,i)))).^2));%signal power
Pn=sum(sum((I(:,:,i)-In(:,:,i)).^2));%noise power
snr=abs(snr+10*log10(Ps/Pn));
end
snr=abs(snr/3);
end