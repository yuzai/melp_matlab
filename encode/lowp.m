function y=lowp(x,f1,f3,rp,rs,Fs)
%低通滤波
%使用注意事项：通带或阻带的截止频率的选取范围是不能超过采样率的一半
%即，f1,f3的值都要小于 Fs/2
%x:需要带通滤波的序列
% f 1：通带截止频率
% f 3：阻带截止频率
%rp：边带区衰减DB数设置
%rs：截止区衰减DB数设置
%FS：序列x的采样频率
% rp=0.1;rs=30;%通带边衰减DB值和阻带边衰减DB值
% Fs=2000;%采样率
%
wp=2*pi*f1/Fs;
ws=2*pi*f3/Fs;
% 设计切比雪夫滤波器；
[n,wn]=cheb1ord(wp/pi,ws/pi,rp,rs);
[bz1,az1]=cheby1(n,rp,wp/pi);
%查看设计滤波器的曲线
[h,w]=freqz(bz1,az1,256,Fs);
h=20*log10(abs(h));
figure;plot(w,h);title('所设计滤波器的通带曲线');grid on;
%
y=filter(bz1,az1,x);%对序列x滤波后得到的序列y
end