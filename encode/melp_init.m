clear all;
%CONST
global FMCQ_CODEBOOK; 
global Wf;
global ham_win;
global stage1 stage2;
ham_win=hamming(200)';    			            %������ϵ��
coeff;
stage;                        					%MSVQ�ļ�����(stage1(128),stage2(64,64,64))               
melp_wf;                      					%����Ҷ���ȼ�Ȩ����ϵ��
          					%����Ҷ�׷����뱾(256)
CODEBOOK_FMCQ1;
CODEBOOK_FMCQ2;

s=audioread('test.wav')';
s=s*32767;               %����32767��-1��1��16bit�з�������
FRL=180;             %length of frame,����һ֡�ĳ��ȣ�180
Nframe=fix(length(s)/FRL);  %������������������֡����Ŀ

%global sig_in,ǰ��֡���ź�����Ϊȫ0
sig_in(1:FRL*2)=0;          					   %ǰһ֡�ź�
%global cheb_s;
cheb_s(1:4)=0;  					               %60Hz�Ľ��б�ѩ���ͨ�˲����ĳ�ʼ״̬

%global sig_1000
sig_1000(1:FRL*2)=0;
butter_s(1:6)=0;

%global melp_bands state_b state_e statet
melp_bands(1:5,1:FRL*2)=0;            		   %ǰһ֡������Ӵ��ź�
state_b(1:5,1:6)=0;                          %��ͨ�˲�����״̬
state_e(1:4,1:2)=0;                          %ȫ�������˲����ĳ�ʼ״̬
state_t(1:4,1:6)=0;        				      %����첨�м���̵�״̬
%global melp_envelopes
melp_envelopes(1:4,1:FRL*2)=0;              	%ǰһ?���ĸ������ź�
%global pre_intp
pre_intp=40;                  					%ǰһ֡����������
%pre_intr=0.1;                 					%ǰһ֡������������Ӧ�����ϵ��
frame_num=320;                 					%ȡ��?��
%global buffer
buffer=[50,50,50];                           %���������ǿ�Ļ���ֵ
%global pavg G2p
pavg=50;                                     %ƽ������
G2p=20;                                      %ǰһ֡�ĵ�2����
