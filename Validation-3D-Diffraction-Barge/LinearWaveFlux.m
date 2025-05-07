function dPhi_dn = LinearWaveFlux( Wave,H_D,xx,yy,zz,n_B )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

global g;

A0 = Wave.Amplitude;
K  = Wave.Number;
K1 = Wave.K1;
K2 = Wave.K2;
w  = Wave.Frequency;

a1 = g * A0 * K1 / w;
a2 = cosh(K*(zz + H_D)) ./ cosh(K*H_D);
a3 = exp(1i .* (K1 .* xx + K2 .* yy));
dPhi_dx = a1 .* a2 .* a3;

a4 = g * A0 * K2 / w;
a5 = cosh(K*(zz + H_D)) ./ cosh(K*H_D);
a6 = exp(1i .* (K1 .* xx + K2 .* yy));
dPhi_dy = a4 .* a5 .* a6;

a7 = -1i * g * A0 * K / w;
a8 = sinh(K*(zz + H_D)) ./ cosh(K*H_D);
a9 = exp(1i .* (K1 .* xx + K2 .* yy));
dPhi_dz = a7 .* a8 .* a9;

dPhi_dn = dPhi_dx .* n_B(:,1) + dPhi_dy .* n_B(:,2) + dPhi_dz .* n_B(:,3);

end

