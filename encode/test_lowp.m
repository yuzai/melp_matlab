fs=2000;
t=(1:fs)/fs;
ff1=100;
ff2=400;
x=sin(2*pi*ff1*t)+sin(2*pi*ff2*t);
figure;
subplot(211);plot(t,x);
subplot(212);hua_fft(x,fs,1);
%��ͨ����
% y=filter(bz1,az1,x);
y=lowp(x,300,350,0.1,20,fs);
figure;
subplot(211);plot(t,y);
subplot(212);hua_fft(y,fs,1);%hua_fft()�����ǻ�Ƶ��ͼ�ĺ��������������������Ҫ����Ϊm�ļ�����
%������ӻ����������Լ�д��ר�Ż�Ƶ��ͼ�ĺ�����Ҳ��������Ȼ�ò����ҵĽ��
%���źŵķ�Ƶ�׺͹�����
%Ƶ��ʹ��matlab���ӱ�ʾ
function hua_fft(y,fs,style,varargin)
%��style=1,����ֵ�ף���style=2,��������;��style=�����ģ���ô����ֵ�׺͹�����
%��style=1ʱ�������Զ�����2����ѡ����
%��ѡ�������������������Ҫ�鿴��Ƶ�ʶε�
%��һ������Ҫ�鿴��Ƶ�ʶ����
%�ڶ�������Ҫ�鿴��Ƶ�ʶε��յ�
%����style���߱���ѡ���������������뷢��λ�ô���
nfft= 2^nextpow2(length(y));%�ҳ�����y�ĸ���������2��ָ��ֵ���Զ��������FFT����nfft��
%nfft=1024;%��Ϊ����FFT�Ĳ���nfft
  y=y-mean(y);%ȥ��ֱ������
y_ft=fft(y,nfft);%��y�źŽ���DFT���õ�Ƶ�ʵķ�ֵ�ֲ�
y_p=y_ft.*conj(y_ft)/nfft;%conj()��������y�����Ĺ������ʵ���Ĺ������������
y_f=fs*(0:nfft/2-1)/nfft;%?T�任���Ӧ��Ƶ�ʵ�����
% y_p=y_ft.*conj(y_ft)/nfft;%conj()��������y�����Ĺ������ʵ���Ĺ������������
if style==1
    if nargin==3
        plot(y_f,2*abs(y_ft(1:nfft/2))/length(y));%matlab�İ����ﻭFFT�ķ���
        %ylabel('��ֵ');xlabel('Ƶ��');title('�źŷ�ֵ��');
        %plot(y_f,abs(y_ft(1:nfft/2)));%��̳�ϻ�FFT�ķ���
    else
        f1=varargin{1};
        fn=varargin{2};
        ni=round(f1 * nfft/fs+1);
        na=round(fn * nfft/fs+1);
        plot(y_f(ni:na),abs(y_ft(ni:na)*2/nfft));
    end
elseif style==2
            plot(y_f,y_p(1:nfft/2));
            %ylabel('�������ܶ�');xlabel('Ƶ��');title('�źŹ�����');
    else
        subplot(211);plot(y_f,2*abs(y_ft(1:nfft/2))/length(y));
        ylabel('��ֵ');xlabel('Ƶ��');title('�źŷ�ֵ��');
        subplot(212);plot(y_f,y_p(1:nfft/2));
        ylabel('�������ܶ�');xlabel('Ƶ��');title('�źŹ�����');
end
end