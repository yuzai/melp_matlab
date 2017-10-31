%Find harmonics of the base frequency
%Input:
%        res(residual signal of the quantized LPC)
%        p3(final pitch)
%Output:
%        mag(fourier spectrum magnitude)

function mag=find_harm(res,p3)
down=fix(256/p3);                %floor level of the base frequency
M=fix(p3/4);                     %Get the number of the harmonics
if M<10
   for n=1:M
      up=fix((n+0.5)*512/p3);
      mag(n)=max(res(down:up));
      down=up+1;
   end
   mag=mag*sqrt(M)/norm(mag);
   mag(M+1:10)=1;  
else
   for n=1:10
      up=fix((n+0.5)*512/p3);
      mag(n)=max(res(down:up));
      down=up+1;
   end
   mag=mag*sqrt(10)/norm(mag);
end