%LPC参数到LSF参数的转化
%Convert LPC parameters to LSF parameters
%Precondition:   LPC parameters(a)
%Postcondition:  LSF parameters(f)

%In this sub program ,all polynomials' parameters are ascending aligned.

function f=melp_lpc2lsf(a)
%初始化求根方程的系数
P(1,1)=1;
P(2,1)=1;
%求出求根方程的系数
for i=1:5
   P(1,i+1)=a(i)+a(11-i)-P(1,i);
   P(2,i+1)=a(i)-a(11-i)+P(2,i);    
end
P(:,6)=P(:,6)/2;   % Get the equation for roots(Descend order)
P=fliplr(P);
%求出车比雪夫多项式的系数
b(1:6,1:6)=0;
b(1,1)=1;
b(2,2)=1;
for i=1:4
   b(i+2,1:i+2)=2*[0,b(i+1,1:i+1)]-[b(i,1:i),0,0];
end
%将三角方程转换为代数方程
P=P*b;
f1=0;   %Get two polynomial P and Q
%用两分法求出代数方程的根
for ii=1:2
	k=pi/60;
	y1=sum(P(ii,:));
	i=1;

	while i<61
   	cosx=cos(i*k);
   	y2=cosx.^(1:5)*P(ii,2:6)'+P(ii,1);
   	if y2==0
      	f1=[f1,i*k];
      	i=i+1;
      	cosx=cos(i*k);
      	y2=cosx.^(1:5)*P(ii,2:6)'+P(ii,1);
   	elseif y1*y2<0
      	x1=(i-1)*k;
      	x2=i*k;
      	for j=1:4
         	x=(x1+x2)/2;
         	cosx=cos(x);
         	temp=cosx.^(1:5)*P(ii,2:6)'+P(ii,1);
         	if temp==0
            	f1=[f1,x];
            	break;
         	elseif temp*y2<0
            	x1=x;
         	else
            	x2=x;
            	y2=temp;
         	end
      	end
      	if temp~=0
         	f1=[f1,(x1+x2)/2];
      	end
   	end
   	y1=y2;
   	i=i+1;
   end
end
temp=size(f1);
m=temp(2);
f(1:10)=0;
if m==11
   f(1:10)=0;
   f((1:5)*2-1)=f1(2:6);
   f((1:5)*2)=f1(7:11);
end


   
   
      
         
      
      
      
   

