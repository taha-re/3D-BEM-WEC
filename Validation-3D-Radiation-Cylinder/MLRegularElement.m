function [ Mij,Lij ] = MLRegularElement( Xp,X1,X2,X3 )
%This function evaluates Regular elements of M matrix and "L" Matrix
%"M" Matrix includes Normal derivetive of Green function; R_G/R_n
%"L" Matrix includes Green function; G
%Note that --> (M+0.5*I) * phi = L * phi_n

%   INPUT ::
%           X1,X2,X3 :: three corners of the triangular element, marked CCW
%           Xp       :: Load point
%   OUTPUT ::
%            Mij      :: ij_th element of "M" matrix
%            Lij      :: ij-th element of "L" matrix
%   Other ::
%            e2,e3    :: Vector of two edges of the triangle
%            n        :: normal Vector of the triangle surface 
%            A_T      :: area of the triangle
%            u,v,w    :: x_coordinate,y_coordinate,weight of Gauss points for
%                        integration
%            Ng       :: Number of Gauss points,Consult with function "TriGaussPoints"
%            M1,M2,M3 :: Shape finction for Vertices X1,X2,X3
%            Xq       :: actual coordinate of Gauss points in real space
%            r_v      :: the vector that shows distance between Load point "Xp" and Gauss
%                        points "Xq",   r_v = Xq_v - Xp_v
%            r        :: magnitude of distance vector
%            RG_Rn    :: value of the derivative of Green function at Gauss points
%            G        :: value of the Green function at Gauss points



e2 = X2 - X1; 
e3 = X3 - X1;
n  = cross(e2,e3);
n  = n / norm(n);
A_T = 0.5 * norm(cross(e2,e3));

[ u,v,w ] = TriGaussPoints( 8 );
Ng = 16;

M1 = 1-u-v; 
M2 = u; 
M3 = v;

Xq = zeros(Ng,3);
for ii = 1:Ng
    Xq(ii,:) = M1(ii) .* X1 + M2(ii) .* X2 + M3(ii) .* X3;
end

r_v = zeros(Ng,3);
r = zeros(1,Ng);
for ii = 1:Ng
    r_v(ii,:) = Xq(ii,:) - Xp;
    r  (ii) = norm(r_v(ii,:));
end

RG_Rn = zeros(Ng,1);
G     = zeros(Ng,1);
for ii = 1:Ng
    RG_Rn(ii) = dot(n,r_v(ii,:)) / ( -4.0 * pi * r(ii)^3);
    G    (ii) = 1.0 / ( 4.0 * pi * r(ii));
end

Mij = A_T * sum(w .* RG_Rn);
Lij = A_T * sum(w .* G    );

end