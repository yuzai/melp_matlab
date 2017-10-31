%FRACTIONAL PITCH REFINEMENT
%PRECONDITION:   INTPITCH(T);signal(s)(240samples,180samples of current frame and
%                60samples of next frame,cT_T-
%POSTCONDITION:  Fractal pitch and corresponding autocorrelation
%   				  fp is the fractional pitch;fr is the autocorrelation
%Input:
%                 sig(input signal)
%                 T(input integer pitch)
%Output:
%                 fp(fractal pitch)
%                 fr(corresponding correlation)
function [fp,fr]=fpr(sig,T)
k=fix(T/2);
%autocorrelation 
c0_tm1=sig(100-k:259-k)*sig(100-k+T-1:259-k+T-1)';    %c(0,t-1)
c0_t1=sig(100-k:259-k)*sig(100-k+T+1:259-k+T+1)';     %c(0,t+1)
c0_t=sig(100-k:259-k)*sig(100-k+T:259-k+T)';          %c(0,t)
if c0_tm1>c0_t1                                       %judge the range of fp
    c0_t1=c0_t;
    c0_t=c0_tm1;
    T=T-1;
end

ct_t=sig(100-k+T:259-k+T)*sig(100-k+T:259-k+T)';      %c(t,t)
c0_0=sig(100-k:259-k)*sig(100-k:259-k)';              %c(0,0)
ct_t1=sig(100-k+T:259-k+T)*sig(100-k+T+1:259-k+T+1)'; %c(t,t+1)
ct1_t1=sig(100-k+T+1:259-k+T+1)*sig(100-k+T+1:259-k+T+1)';  %c(t+1,t+1)
%correlation parameter
den=c0_t1*(ct_t-ct_t1)+c0_t*(ct1_t1-ct_t1);
if abs(den)>0.01
    delta=(c0_t1*ct_t-c0_t*ct_t1)/den;
else
    delta=0.5;
end
if delta<-1
   delta=-1;
   end
if delta>2
   delta=2;
end
fp=T+delta;    %add the offset to the integer pitch
den=c0_0*(ct_t*(1-delta)^2+2*delta*(1-delta)*ct_t1+delta^2*ct1_t1);
den=sqrt(den);
if den>0.01
    fr=((1-delta)*c0_t+delta*c0_t1)/den;
else
    fr=0;
end
if fp<20
   fp=20;
end
if fp>160
   fp=160;
end



