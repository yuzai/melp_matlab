%compute the No.1 reflection coefficient
function k=d_k1(p)
k=-p(10);
for n=1:9
   j=11-n;
   for i=1:j-1
      pp(i)=(p(i)-k*p(j-i))/(1-k^2);  %overflow
   end
   p=pp;
   k=-p(j-1);
end     