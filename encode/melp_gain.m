%Gain assess
%input:
%        s(input signal)
%        vbp1(voicing of No.1 band)
%        p2(fractal pitch)
%output:
%        G(G(1) is the first Gain,G(2) is the second Gain)
function G=melp_gain(s,vbp1,p2)
k=1;
Ltmp=p2;
Lfr=p2;
if vbp1>0.6
   while Ltmp<180
      k=k+1;
      Lfr=Ltmp;
      Ltmp=p2*k;
   end
else
   Lfr=120;
end
HL=round(Lfr/2);
Lfr=HL*2;
G(1)=10*log10(0.01+s(91-HL:90+HL)*s(91-HL:90+HL)'/Lfr);
G(2)=10*log10(0.01+s(181-HL:180+HL)*s(181-HL:180+HL)'/Lfr);
for k=1:2
   if G(k)<0
      G(k)=0;
   end
end
