function Phi = LinearWavePotential( Wave,H_D,xx,yy,zz )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

global g;

A0 = Wave.Amplitude;
K  = Wave.Number;
K1 = Wave.K1;
K2 = Wave.K2;
w  = Wave.Frequency;

a1 = -1i * g * A0 / w;
a2 = cosh(K*(zz + H_D)) ./ cosh(K*H_D);
a3 = exp(1i .* (K1 .* xx + K2 .* yy));
Phi = a1 .* a2 .* a3;

end

