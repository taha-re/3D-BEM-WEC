function Centroid = QuadCentroid( X1,X2,X3,X4 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

e12 = X2 - X1;
e13 = X3 - X1;
e14 = X4 - X1;

A1 = .5 * norm(cross(e12,e13));
A2 = .5 * norm(cross(e13,e14));

Xc1 = (X1 + X2 + X3) ./ 3;
Xc2 = (X1 + X3 + X4) ./ 3;

Centroid = ((A1 .* Xc1) + (A2 .* Xc2)) ./ (A1+A2);

end

