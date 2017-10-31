%Pitch Double Check--Using a kind of signal
%Input:
%        sig_in(input signal)
%        p(fractal pitch)
%        Dth(threshold)
%Output:
%        pc(pitch after double_chk)
%        cor_pc(corresponding correlation)
function [pc,cor_pc]=double_ck(sig_in,p,Dth)
pmin=20;                                                             %minimum pitch
[pc,cor_pc]=FPR(sig_in,round(p));                                    %fractal pitch refine
for n=1:7                                                            %Search the very pitch
   k=9-n;
   temp_pit=round(pc/k);
   if temp_pit>=pmin
      [temp_pit,temp_cor]=FPR(sig_in,temp_pit);
      if temp_pit<30
         temp_cor=double_ver(sig_in,temp_pit,temp_cor);
      end
      if temp_cor>Dth*cor_pc
         [pc,cor_pc]=FPR(sig_in,round(temp_pit));
         break;
      end
   end
end
if pc<30
   cor_pc=double_ver(sig_in,pc,cor_pc);                              %Remove furious short pitch
end