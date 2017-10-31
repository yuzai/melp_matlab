%median filt
%Input:
%        p3(final pitch)
%        rp2(the corresponding correlation of p3)
%        G2(the 2nd Gain)
%        buffer(pitch buffer)
%Output:
%        pavg(average pitch)
%        buffer(refreshed buffer)
function [pavg,buffer]=melp_APU(p3,rp3,G2,buffer)
if (rp3>0.8)&(G2>30)
   buffer=[buffer(2:3),p3];
else
   buffer=buffer*0.95+2.5;
end
pavg=median(buffer);
