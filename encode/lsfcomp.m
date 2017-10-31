function [ee,dd]=lsfcomp(lpc2,lpcs)
del=pi/512;
for j=1:256
   zz=exp(i*del*(j)).^(0:10);
   aa(j)=zz*([1,lpc2])';
   bb(j)=zz*([1,lpcs])';
   dd(j)=1/abs(bb(j));
   ee(j)=1/abs(aa(j));
end   