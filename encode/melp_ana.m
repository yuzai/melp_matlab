%%%%%%%%RUN This Program to Encode%%%%%%%%%%%%%

%Global varible and constant
%global dcr_ord dcr_num dcr_den FRL cheb_s sig_in
%global butt_1000ord butt_1000num butt_1000den state butter_s sig_1000
%global melp_bands state_b melp_envelopes state_e pre_intp
%global G2p ham_win
%global buffer pavg
melp_init;
for FRN=1:(Nframe-1)             %%%%%%%%%%%%%%%%%%%%
%Refresh buffers
%Get new speech(filted by 4-order chebyshev filter)
sig_in(1:FRL)=sig_in(FRL+1:FRL*2);                  
%Refresh 1000Hz speech buffer
sig_1000(1:FRL)=sig_1000(FRL+1:FRL*2);
%Refresh bandpass speech                       
melp_bands(:,1:FRL)=melp_bands(:,FRL+1:FRL*2);              
%Refresh envelope bandpass speech
melp_envelopes(:,1:FRL)=melp_envelopes(:,FRL+1:FRL*2);      

%Get a new frame speech
sig_origin=s((FRN-1)*FRL+1:FRN*FRL);                         
%Reduce the direct current
[sig_in(FRL+1:FRL*2),cheb_s]=melp_iir(sig_origin,cheb_s,dcr_ord,dcr_num,dcr_den,FRL);

%Get integer pitch
[sig_1000(FRL+1:FRL*2),butter_s]=melp_iir(sig_in(FRL+1:FRL*2),butter_s,butt_1000ord,butt_1000num,butt_1000den,180);
cur_intp=intpitch(sig_1000,160,40);

%bandpass analyze
%Get bandpass and envelopes
[melp_bands(:,FRL+1:FRL*2),state_b,melp_envelopes(:,FRL+1:FRL*2),state_e]=melp_5b(sig_in(FRL+1:FRL*2),state_b,state_e);
%Get fractal pitch
[p2,vp(1)]=pitch2(melp_bands(1,:),cur_intp);
%bandpass voicing analyse
vp(2:5)=melp_bpva(melp_bands,melp_envelopes,p2);
%pre_intp=cur_intp;
r2=vp(1);

%jitter
if vp(1)<0.5
    jitter=1;
else
    jitter=0;
end

%LPC analyse
e_lpc=melp_lpc(sig_in(81:280));
%temp_lpc=lpc(sig_in(81:280),10);
%e_lpc=temp_lpc(2:11);

%LPC Residual
e_resid=lpc_residual(e_lpc,sig_in,350);

%Peakness Check
peak=sqrt(e_resid(106:265)*e_resid(106:265)'/160)/(sum(abs(e_resid(106:265)))/160);
%peak=sqrt(160)*norm(e_resid(106:265))/norm(e_resid(106:265),1);

%jitter voice detect
if peak>1.34
    vp(1)=1;
end
if peak>1.6
    vp(2:3)=1;
end

%Final pitch dectect
temp_s(1:6)=0;
[fltd_resid,temp_s]=melp_iir(e_resid,temp_s,butt_1000ord,butt_1000num,butt_1000den,350);
temp(1:5)=0;
fltd_resid=[temp,fltd_resid,temp];
%global pavg;
[p3,r3]=pitch3(sig_in,fltd_resid,p2,pavg);

%Gain
G=melp_gain(sig_in,vp(1),p2);

%Refresh average pitch
[pavg,buffer]=melp_APU(p3,r3,G(2),buffer);

%Get LSF 
LSF=melp_lpc2lsf(e_lpc);

%minimun distance expand
LSF=lsf_clmp(LSF);

%Muti-stage Vector Quatization
MSVQ=melp_MSVQ(e_lpc,LSF);

%Gain quantization
QG=melp_Qgain(G2p,G);
G2p=G(2);

%Fourier Spectrum Magnitude
lsfs=d_lsf(MSVQ);
lpc2=melp_lsf2lpc(lsfs);
tresid2=lpc_residual(lpc2,sig_in(76:285),200);
resid2=tresid2.*ham_win;
resid2(201:512)=0;
magf=abs(fft(resid2));
fm=find_harm(magf,p3);

%Quantize Fourier Magnitude
QFM=melp_FMCQ(fm);

%×éÖ¡  C(N)=struct('ls',0,'fm',0,'pitch',0,'G',0,'vp',0,'jt',0);
c(FRN).ls=MSVQ;
c(FRN).QFM=QFM;
c(FRN).G=QG;
if vp(1)>0.6
    c(FRN).pitch=p3;
    c(FRN).vp=vp(2:5);
    c(FRN).jt=jitter;
else
    c(FRN).pitch=0;
    c(FRN).vp=0;
    c(FRN).jt=0;    
end
end
   