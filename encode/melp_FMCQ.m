%s(1:360);res_msvq(1:180)
function f=melp_FMCQ(mag)
%���̣ӣƲ���ת��Ϊ�̣ӣƲ���
global ham_win;
global Wf;
global FMCQ_CODEBOOK;
%����
%��ʱ����������Ĳ���
temp=1000;
for n=1:256
   u=FMCQ_CODEBOOK(n,1:10)-mag;
   rms=Wf*(u.*u)';
   if rms<temp
      temp=rms;
      f=n;
   end
end
      
      
      
   



