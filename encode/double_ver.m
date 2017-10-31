%Remove furious short 
%Input:
%        sig_in(input signal)
%        cor_p(correlation)
%Output:
%        cor_p(output correlation)
function cor_p=double_ver(sig_in,pp,cor_p)
[np,ncor_p]=FPR(sig_in,round(2*pp));      %check the correlation of 2*pitch
if ncor_p<cor_p
   cor_p=ncor_p;
end
