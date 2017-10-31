%C is the struct array which contain the coded data produced by coder.
%function v=melp_decoder(C)
d_init;
C=c;
TEMPSIZE=size(C);
FRN=TEMPSIZE(2);
for i=1:FRN
   ls2=d_lsf(C(i).ls);
   [G1,G2,G2pt,G2p_error]=d_gains(C(i).G,G2pt,G2p_error);
   Gno=noise_est(G1,Gno);
   G1=noise_sup(G1,Gno);
   Gno=noise_est(G2,Gno);
   G2=noise_sup(G2,Gno);
   if C(i).pitch~=0
      global fm2 jt2 vp2;
      fm2=FMCQ_CODEBOOK(C(i).QFM,:);
      jt2=C(i).jt;
      vp2=[1,C(i).vp];
      p2=C(i).pitch;
   else
      p2=0;
   end
   temp=melp_lsf2lpc(ls2);
   u2=max(0,d_k1(temp)*0.5);
   if (p1==0)&(p2~=0)    %Judge transform from u to v
     	fm1=fm2;
     	p1=p2;
     	jt1=jt2;
     	vp1=vp2;
   end
   if t0>1
      sig_fr=sig_fr(181:t0+179);
   else
      sig_fr=[];
   end
   while t0<181
      e=0;
      g=0;
      h=0;
      %Decode in a period
      %d_interpolate;
      %parameter interpolate
   if p2==0        %unvoiced
      T=50;
      factor=t0/180;
      if t0<91
         G=G2p+2*factor*(G1-G2p);   %0~90
	   else
         G=G1+(2*factor-1)*(G2-G1); %91~180
	   end
      lsfs=factor*(ls2-ls1)+ls1;
      u=factor*(u2-u1)+u1;
   else             %voiced
	   factor=t0/180;
	   jt=factor*(jt2-jt1)+jt1;
	   fm=factor*(fm2-fm1)+fm1;
	   vp=factor*(vp2-vp1)+vp1;
	   if t0<91
   	   G=G2p+factor*(G1-G2p)/90;
	   else
   	   G=G1+factor*(G2-G1)/90;
	   end
	   if G2-G2p>6
   	   factor=(G-G2p)/(G2-G2p);
	   end
	   lsfs=factor*(ls2-ls1)+ls1;
	   T=factor*(p2-p1)+p1;
      u=factor*(u2-u1)+u1;
      if ((G1-G2p)>6)&(p1>2*p2)
   	   T=p2;
	   end
   end
      if p2==0
         ep1(1:5)=0;
         e=rand(1,T)-1;
   	else      	
       	[e,state_pul,state_noi,T]=d_mix(fm,T,jt,vp,state_pul,state_noi);
   	end
   	lpcs=melp_lsf2lpc(lsfs);
   	[g,state_ase,state_tilt]=d_ase(e,lpcs,G,Gno,u,T,state_ase,state_tilt);
      %v_nase=[v_nase,g];
      [h,state_syn]=d_lps(lpcs,g,T,state_syn);
      t0=t0+T;
      h=d_ga(T,h,G);
      sig_fr=[sig_fr,h];
   end
   [temp,state_disp]=d_disp(sig_fr,state_disp,disperse);
   v=[v,temp];
   G2p=G2;
   ls1=ls2;
   u1=u2;
   t0=t0-180;
   if p2~=0
      p1=p2;
      fm1=fm2;
      jt1=jt2;
   end         
end

   
      
      
   
   