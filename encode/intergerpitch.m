%integer pitch detect
%PRECONDITION:   Current frame and next frame--------ss(1:360)
%POSTCONDITION:  Autocorrelation
%input:
%        ss(input signal)
%        ipmax(maxim integer pitch)
%        ipmin(minimum integer pitch)
%output:
%        T(integer pitch)
function T=intergerpitch(ss,ipmax,ipmin)

debug = zeros(1,ipmax);

T = 80;
r=0;
r_new = 0;
for tao=ipmin:ipmax
    k = fix(tao/2);
    c0_0 = ss(100-k:259-k)*ss(100-k:259-k)';
    ct_t = ss(100-k+tao:259-k+tao)*ss(100-k+tao:259-k+tao)';
    c0_t = ss(100-k:259-k)*ss(100-k+tao:259-k+tao)';
    if c0_0*ct_t>=0
      r_new = c0_t*c0_t/(c0_0*ct_t);
      debug(1,tao) = r_new;
    else
      debug(1,tao) = c0_t*c0_t/(c0_0*ct_t);
    end
    if r_new > r
        r = r_new;
        T = tao;
    end
end
plot(debug);