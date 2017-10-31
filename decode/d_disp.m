%the size of s is 64+180
%pulse dispersion
function [f,state_disp]=d_disp(sig_in,state_disp,disperse)
buffer1=[state_disp,sig_in];
for i=1:180
   f(i)=buffer1(i:i+64)*disperse;
end
state_disp=sig_in(116:180);