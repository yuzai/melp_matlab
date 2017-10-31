%s(1:360);res_msvq(1:180)
function f=melp_FMCQ(mag)
%将ＬＳＦ参数转化为ＬＳＦ参数
global ham_win;
global Wf;
global FMCQ_CODEBOOK;
%量化
%暂时不进行下面的步骤
temp=1000;
for n=1:256
   u=FMCQ_CODEBOOK(n,1:10)-mag;
   rms=Wf*(u.*u)';
   if rms<temp
      temp=rms;
      f=n;
   end
end
      
      
      
   



