%integer pitch detect
%PRECONDITION:   Current frame and next frame--------ss(1:360)
%POSTCONDITION:  Autocorrelation
%input:
%        ss(input signal)
%        ipmax(maxim integer pitch)
%        ipmin(minimum integer pitch)
%output:
%        T(integer pitch)
function T=intpitch(ss,ipmax,ipmin) %,c_0_0,c_0_t,c_t_t
r=0;
T=80;
r_new=0;
for tao=ipmin:ipmax
   k=fix(tao/2);
   c0_0=ss(100-k:259-k)*ss(100-k:259-k)';
   ct_t=ss(100-k+tao:259-k+tao)*ss(100-k+tao:259-k+tao)';
   c0_t=ss(100-k:259-k)*ss(100-k+tao:259-k+tao)';
   den=c0_0*ct_t;
   if den>0
      r_new=c0_t*c0_t/den;
   end
   if r_new>r
      r=r_new;
      T=tao;         
   end   
end
r_new