%Get 5 band's bandpass signal and the 2~4 bands' envelopes
%Input:
%        sig_in(input signal)
%        state_b(original bandpass filter's state)
%        state_e(original envelopes filter's state)
%output:
%        bands(bandpass signal)
%        state_b(final state of bandpass filters)
%        envelopes(envelopes of the bandpass signal)
%        state_e(final state of envelopes filters)
function [bands,state_b,envelopes,state_e]=melp_5b(sig_in,state_b,state_e)
global butt_bp_ord butt_bp_num butt_bp_den
global smooth_ord smooth_num smooth_den
for i=1:5
    [bands(i,:),state_b(i,:)]=melp_iir(sig_in,state_b(i,:),butt_bp_ord,...
    butt_bp_num(i,:),butt_bp_den(i,:),180);
end
temp1=abs(bands(2:5,:));
for i=1:4
    [envelopes(i,:),state_e(i,:)]=melp_iir(temp1(i,:),state_e(i,:),smooth_ord,...
    smooth_num(1,:),smooth_den(1,:),180);
end

   