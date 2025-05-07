function [ Mii,Lii ] = MLSingularQuadElement( Xp,X1,X2,X3,X4 )
%This function evaluates singular element of "M" Matrix and "L" Matrix
%"M" Matrix includes Normal derivetive of Green function; R_G/R_n
%"L" Matrix includes Green function; G
%Note that --> (M+0.5*I) * phi = L * phi_n
%Note that --> Xp is coplanar with the rectangle and lies withn it

%   INPUT ::
%           X1,X2,X3,X4 :: four corners of the rectangular element, marked CCW
%           Xp          :: Load point, which lies with in the rectangle
%   OUTPUT ::
%            Mii :: ii-th (diagonal) element of "M" matrix
%            Lii :: ii-th (diagonal) element of "L" matrix
%   Other ::
%            a,b :: length of the edeges of the rectangel 

a = norm(X2 - X1);
b = norm(X3 - X2);

dummy1 = a * log((b/a)+sqrt(1+(b/a)^2));
dummy2 = b * log((a/b)+sqrt(1+(a/b)^2));

Lii = (dummy1 + dummy2) / (2 * pi);
Mii = 0.0;

end

