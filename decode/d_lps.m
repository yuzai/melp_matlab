function [f,state_syn]=d_lps(lpc_coeff,ae,T,state_syn)
buffer=state_syn;
lpc_coeff=fliplr(lpc_coeff);
lpc_coeff=lpc_coeff';
for i=1:T
   buffer(i+10)=ae(i)-buffer(i:i+9)*lpc_coeff;
end
f=buffer(11:T+10);
state_syn=buffer(T+1:T+10);

