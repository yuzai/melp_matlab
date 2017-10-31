%noise estimate
function G_n=noise_est(gain,G_n)
global Cup Cdown
if gain>G_n+Cup
   G_n=G_n+Cup;
elseif gain<G_n-Cdown
   G_n=G_n-Cdown;
else
   G_n=gain;
end
if G_n<10
   G_n=10;
elseif G_n>20
   G_n=20;
end
