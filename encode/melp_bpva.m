%Bandpass Voicing Analog
%Precondition:   s(1:360) 是输入的语音信号;intP是前一帧和当前帧的整数基音;intR是对应的相关系数
%		           smooth是平滑滤波器的状态,full_wave是全波整形滤波器的状态,melp_bands(1:180)是五个带通信号
%                在上一帧的结果,melp_envelopes是其对应的包络信号
%Input:
%        melp_bands(5个带的带通信号）

function vbp=melp_bpva(melp_bands,melp_envelopes,p2)
p2=round(p2);
for j=1:4
   k=j+1;
   [p(1),r(1)]=FPR(melp_bands(k,:),p2);
   [p(2),r(2)]=FPR(melp_envelopes(j,:),p2);
   r(2)=r(2)-0.1;
   if r(2)>r(1)
      temp=r(2);
   else
      temp=r(1);
   end
   if temp>0.6
      vbp(j)=1;
   else
      vbp(j)=0;
   end
end
if vbp(1:3)==[0 0 0]
   vbp(4)=0; 
end

