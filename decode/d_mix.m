function [e,state_pul,state_noi,T]=d_mix(fm,T,jt,vp,state_pul,state_noi)
global melp_firs;
%����jitter��������
T=T*(1+jt*0.5*(rand-0.5));
T=round(T);
%�޶�����
if T>160
   T=160;
elseif T<20
   T=20;
end

%���㼤���źŲ�ѭ����λ
m(1:10)=fm;
m(T-10:T-1)=fliplr(fm);
if T>21
   m(11:T-11)=1;
end
m=[0,m];
ep=real(ifft(m));
ep=[ep(T-9:T),ep(1:T-10)];
%Scale
ep=ep*sqrt(T)*1000;
en=(rand(1,T)-0.5)*3464;

%��������������ϵ��
efirs(1:31,1)=0;
pfirs=efirs;
for i=1:5
   if vp(i)>0.5
      pfirs=pfirs+melp_firs(:,i);
   else
      efirs=efirs+melp_firs(:,i);
   end
end

ep=[state_pul,ep];
en=[state_noi,en];
for i=1:T
   e(i)=sum(ep(i:30+i)*pfirs+en(i:30+i)*efirs);
end

   


