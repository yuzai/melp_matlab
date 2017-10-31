%IIR filter
%INPUT: 
%	sig_in(input signal)
%       state(initial state of filter)
%       iir_ord(filter order)
%	iir_num(filter numerator)
%	iir_den(filter denumerator)
%       length(input signal's length)
%OUTPUT:
%	sig_out(output signal)
%	state(final state of filter)
function [sig_out,state]=melp_iir(sig_in,state,iir_ord,iir_num,iir_den,length)
%buffer1=state;
%for n=1:length
 %   buffer1(n+iir_ord)=sig_in(n)-buffer1(n:n+iir_ord-1)*(fliplr(iir_den(2:iir_ord+1))');  	%All pole filt
 %   sig_out(n)=buffer1(n:n+iir_ord)*(fliplr(iir_num)');						%All zero filt
%end
%state=buffer1(n+1:n+iir_ord);	%state Refresh
%state=state-mean(state);
%plot(buffer)
%state's dimension is iir_ord
       [sig_out,state]=filter(iir_num,iir_den,sig_in,state);