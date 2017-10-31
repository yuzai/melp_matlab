%DC remove
%Input:
%     x(input signal)
%     state(original state of the DC remove filter)
%     npts(point number of x)
%Output:
%     y(output signal)
%     state(final state of the DC remove filter)
function [y,state]=dc_rmv(x,state,npts)
dc_ord=4;
dc_den=[-0.8592;3.5652;-5.5521;3.8461];
dc_num=[0.9269;-3.7056;5.5574;-3.7056;0.9269];
buffer=state;
for i=1:npts
   buffer(i+dc_ord)=x(i)+buffer(i:i+dc_ord-1)*dc_den; %Pole filter
   y(i)=buffer(i:i+dc_ord)*dc_num;                    %Zero filter
end
state=buffer(i+1:i+dc_ord);                           %state refresh

