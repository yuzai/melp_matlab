%
%code struct
%ls:line spectrum
%jt:jitter
%fm:fourier magnitudes
%pitch:pitch
%G:2 gains
%vp:voice power

%定义全局常量
global FMCQ_CODEBOOK;           
global stage1;
global stage2;
global melp_firs;              
global Cup Cdown;
coeff;
stage;          					%傅立叶谱幅度码本(256)
CODEBOOK_FMCQ1;
CODEBOOK_FMCQ2;
d_pdfs;
Cup=0.0337435;
Cdown=0.135418;

%定义变量

t0=1;
%global G2p u1 ls1 fm1 jt1 p1 ;
%global G1 G2 u2 ls2 fm2 jt2 vp2 p2 T;
%global G2p_error;
G2p_error=0;
p1=0;
ls1=[0.2567 0.4953 0.8229 1.2324 1.6116 2.0507 2.4330 2.7962 3.2184 3.5410];
G2pt=22;
G2p=20;
u1=0;
jt1=0;
fm1(1:10)=1;
vp1=[];
u1=0;
Gno=20;

%初始化普通变量
v=[];                %initial the state of the voice signal.
v_nase=[];
state_pul(1:30)=0;
state_noi(1:30)=0;
state_ase(1:10)=0;
state_syn(1:10)=0;
state_disp(1:64)=0;
state_tilt=0;