%LPC residual
%input:
%     lpcs(LPC parameters)
%     sig_in(input signal)
%     length(output signal length)
%output:
%     f(residual signal)
function f=lpc_residual(lpcs,sig_in,length)
lpcs=fliplr(lpcs);
lpcs=([lpcs,1])';
for i=1:length
   f(i)=sig_in(i:10+i)*lpcs;
end   