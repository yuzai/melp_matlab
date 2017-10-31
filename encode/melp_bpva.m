%Bandpass Voicing Analog
%Precondition:   s(1:360) ������������ź�;intP��ǰһ֡�͵�ǰ֡����������;intR�Ƕ�Ӧ�����ϵ��
%		           smooth��ƽ���˲�����״̬,full_wave��ȫ�������˲�����״̬,melp_bands(1:180)�������ͨ�ź�
%                ����һ֡�Ľ��,melp_envelopes�����Ӧ�İ����ź�
%Input:
%        melp_bands(5�����Ĵ�ͨ�źţ�

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

