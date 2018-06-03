
%% Signal Generating
fs=2048; %The sampling frequency is fixed at 2*pi*(2048) rad/sec
Ts=1/fs;
n=[0:2047];
t=n*Ts;% It contains the 2048 time samples of thr ineeval 0<=t<1
x = 10*sin(2*pi*64*t) + sin(2*pi*250*t) + 20*sin(2*pi*256*t) + 3*sin(2*pi*260*t) + 10*sin(2*pi*512*t);
% w=2*pi*f, f=1/T

%% CT Signal vs its Sampling version
nx=[1:100];
figure(1);
subplot(2,1,1);plot(nx,x(1:100));xlabel('n');ylabel('x(n)');hold on;
subplot(2,1,2);stem(nx,x(nx));xlabel('n');ylabel('x[n]');hold on

%% Windowing
xw=x .* hann(length(t))';
% 使用汉宁窗

%% DFT Spectrum Analyze
figure(2);
fft_x=fftshift(fft(x,2049))./2049;
frange_x=linspace(-fs/2,fs/2,2049);

fft_xw=fftshift(fft(xw,2049))./2049;
frange_xw=linspace(-fs/2,fs/2,2049);
%因为实信号以fs为采样速率的信号在 fs/2处混叠，所以实信号fft的结果中前半部分对应[0, fs/2],后半部分对应[ -fs/2, 0]
%abs()用来求得变换后的振幅
subplot(2,1,1);stem(frange_x,2*abs(fft_x),'r');grid on;
xlabel('Freq/Hz');ylabel('Amp');hold on;
subplot(2,1,2);stem(frange_xw,2*abs(fft_xw),'b');grid on;
xlabel('Freq/Hz');ylabel('Amp');hold on;


 