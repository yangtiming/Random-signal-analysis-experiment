function varargout = untitled2(varargin)
% UNTITLED2 MATLAB code for untitled2.fig
%      UNTITLED2, by itself, creates a new UNTITLED2 or raises the existing
%      singleton*.
%
%      H = UNTITLED2 returns the handle to a new UNTITLED2 or the handle to
%      the existing singleton*.
%
%      UNTITLED2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED2.M with the given input arguments.
%
%      UNTITLED2('Property','Value',...) creates a new UNTITLED2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled2

% Last Modified by GUIDE v2.5 07-Nov-2020 20:04:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled2_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled2_OutputFcn, ...
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


% --- Executes just before untitled2 is made visible.
function untitled2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled2 (see VARARGIN)

% Choose default command line output for untitled2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%
 N      = str2num(get(handles.edit9,'String'))%序列长度和采样频率
 fs     = str2num(get(handles.edit10,'String'))
 f_1 = str2num(get(handles.edit11,'String'))
 f_2 = str2num(get(handles.edit12,'String'))


%%
%生成随机信号样本

%N=1024;fs=1000;                             %序列长度和采样频率
t=(0:N-1)/fs;                               %时间序列
fai=random('unif',0.1,1,2)*2*pi;            %产生2个[0，2pi]内均匀随机数
xn=cos(2*pi*f_1*t+fai(1))+3*cos(2*pi*f_2*t+fai(2))+randn(1,N);
                                            %产生含噪声的随机序列
%%
%显示数据
%显示数据 plot(handles.wave,t,x);                    
plot(handles.axes1,t,xn);
title(handles.axes1,'随机信号时域波形')
%%
%间接法谱估计
Rxx=xcorr(xn,'biased');                     %估计自相关函数Rxx
Sx1=abs(fft(Rxx));                          %对Rxx进行FFT得到功率谱
f=(0:N-1)*fs/N/2;                           %频率轴坐标
plot(handles.axes2,f,10*log10(Sx1(1:N)));grid on;          %用dB/Hz做功率谱单位，画图
xlabel('f(Hz)');
ylabel('Sx(f)(dB/Hz)');
title(handles.axes2,'自相关函数法估计功率谱');
%%
%与其他估计方法（内置函数）对比1
Nseg=256;                                   %分段间隔为256
window=hanning(Nseg);                       %汉宁窗
noverlap=Nseg/2;                            %重叠点数为128
f=(0:Nseg/2)*fs/Nseg;                       %频率轴坐标

%%
Sx2=Burg(xn, fs, 200);  %Burg函数估计功率谱
plot(handles.axes3,Sx2);grid on;
xlabel('f(Hz)');
ylabel('Sx(f)(dB/Hz)');
title(handles.axes3,'Burg函数估计功率谱');
%%
%与其他估计方法（内置函数）对比2
Sx3=pwelch(xn,window,128,Nseg,fs,'onesided')*fs/2;                                 %Welch函数估计功率谱
plot(handles.axes4,f,10*log10(Sx3));grid on;
xlabel('f(Hz)');
ylabel('Sx(f)(dB/Hz)');
title(handles.axes4,'Welch法估计功率谱');


function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function [psdviaBurg, f, p] = Burg(x, Fs, varargin)
%MYBURG      根据burg算法实现的AR模型功率谱计算
% psdviaBurg 根据burg算法求出的功率谱值
% f          频率轴参数
% p          模型阶次
% x          输出信号
% Fs         采样率
% varargin   若为数值型，则为AR模型阶次
%            若为字符串，则为定阶准则，AR模型阶次由程序确定
%
% 解析输入参数内容
if strcmp(class(varargin{1}), 'double')
    p = varargin{1};
elseif ischar(varargin{1})
    criterion = varargin{1};
else
    error('参数2必须为数值型或者字符串');
end
x = x(:);
N = length(x);
% 模型参数求解
if exist('p', 'var') % p变量是否存在，存在则不需要定阶，直接使用p阶
    [a, E] = computeARpara(x, p);
else % p不存在，需要定阶，定阶准则即criterion
    p = ceil(N/3); % 阶次一般不超过信号长度的1/3
    
    % 计算1到p阶的误差
    [a, E] = computeARpara(x, p);
    
    % 根据误差求解目标函数最小值
    kc = 1:p + 1;
    switch criterion
        case 'FPE'
            goalF = E.*(N + (kc + 1))./(N - (kc + 1));
        case 'AIC'
            goalF = N.*log(E) + 2.*kc;
    end
    [minF, p] = min(goalF); % p就是目标函数最小的位置，也即定阶准则给出的阶次
    
    % 使用p阶重新求解AR模型参数
    [a, E] = computeARpara(x, p);
end
[h, f] = freqz(1, a, 20e5, Fs);
psdviaBurg = E(end)*abs(h).^2./Fs;
psdviaBurg=psdviaBurg/abs(max(psdviaBurg));
psdviaBurg=(10*log10(abs(psdviaBurg)))+40;
function [a, E] = computeARpara(x, p)
% 根据信号序列x和阶次p计算AR模型参数和误差
N = length(x);
% 初始值
ef = x; % 前向预测误差
eb = x; % 后向预测误差
a  = 1; % 初始模型参数
E  = x'*x/N; % 初始误差
k  = zeros(1, p); % 为反射系数预分配空间，提高循环速度
E  = [E k]; % 为误差预分配空间，提高速度
for m = 1:p
    % 根据burg算法步骤，首先计算m阶的反射系数
    efm = ef(2:end); % 前一阶次的前向预测误差
    ebm = eb(1:end - 1); % 前一阶次的后向预测误差
    num = -2.*ebm'*efm;  % 反射系数的分子项
    den = efm'*efm + ebm'*ebm; % 反射系数的分母项
    k(m) = num./den; % 当前阶次的反射系数
    
    % 更新前后向预测误差
    ef = efm + k(m)*ebm;
    eb = ebm + conj(k(m))*efm;
    
    % 更新模型系数a
    a = [a; 0] + k(m)*[0; conj(flipud(a))];
    
    % 当前阶次的误差功率
    E(m + 1) = (1 - conj(k(m))*k(m))*E(m);
end