%自适应谱增强滤波
%输入：残差信号、LPC系数
%输出：处理过的信号
function [f,state_ase,state_tilt]=d_ase(e,lpcs,G,Gn,u,T,state_ase,state_tilt)
%计算自适应谱增强滤波器的系数
ppp=(G-Gn-12)/18;         %probability p
if ppp<0
   ppp=0;
elseif ppp>1
   ppp=1;
end
a=0.5*ppp;                
b=0.8*ppp;
a=a.^(1:10);
a=[1,a];
b=b.^(1:10);
a=a.*[1,lpcs];         %get the nominator's parameter
b=b.*lpcs;             %get the denominator's parameter
a=fliplr(a);           
b=fliplr(b);
a=a';
b=b';
u=ppp*u;

%自适应谱增强滤波             
buffer=state_ase;
for i=1:T
   buffer(i+10)=e(i)-buffer(i:i+9)*b;
   buffer(i)=buffer(i:i+10)*a;
   f(i)=buffer(i)+u*state_tilt;
   state_tilt=buffer(i);
end
state_ase=buffer(T+1:T+10);

