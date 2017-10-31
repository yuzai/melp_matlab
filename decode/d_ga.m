%增益调整
function s=d_ga(T,s,G)
sg2=10^(G/20)*sqrt(T)/norm(s);
%delta=(sg2-sg1)/10;
%for i=1:9
%   s(i)=(sg1+delta*i)*s(i);
%end
%s(10:T)=sg2*s(10:T);
%sg1=sg2;
s=sg2*s;