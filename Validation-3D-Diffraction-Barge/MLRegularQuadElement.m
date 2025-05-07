function [ Mij,Lij ] = MLRegularQuadElement( Xp,X1,X2,X3,X4 )
%This function evaluates Regular elements of M matrix and "L" Matrix
%"M" Matrix includes Normal derivetive of Green function; R_G/R_n
%"L" Matrix includes Green function; G
%Note that --> (M+0.5*I) * phi = L * phi_n

%   INPUT ::
%           X1,X2,X3,X4 :: Four corners of the Quadrilateral element, marked CCW
%           Xp          :: Load point
%   OUTPUT ::
%            Mij      :: ij_th element of "M" matrix
%            Lij      :: ij-th element of "L" matrix
%   Other ::
%            XX          :: Coordinates of all Vertices in one Matrix
%            e2,e3       :: Vector of two edges of the rectangule
%            n           :: normal Vector of the triangle surface
%            u,v,w       :: x_coordinate,y_coordinate,weight of Gauss points for
%                           integration
%            Ng          :: Number of Gauss points
%                           ,Consult with function "QuadGaussPoints"
%            M1,M2,M3,M4 :: Shape finction for Vertices X1,X2,X3,X4
%            Xq          :: actual coordinate of Gauss points in real space
%            J           :: determinant of the Jacobian at each Gauss
%                           Point
%            P           :: derivetive of shape function with respect to
%                           (u,v) coordinates at each Gauss Point
%            r_v         :: the vector that shows distance between Load point "Xp" and Gauss
%                           points "Xq",   r_v = Xq_v - Xp_v
%            r           :: magnitude of distance vector
%            RG_Rn       :: value of the derivative of Green function at Gauss points
%            G           :: value of the Green function at Gauss points

XX = [X1;X2;X3;X4];

e2 = X2 - X1; 
e3 = X4 - X1;
n  = cross(e2,e3);
n  = n / norm(n);

Ng = 9.0;
[ u,v,w ] = QuadGaussPoints( Ng );

M1 = (1-u) .* (1-v) / 4.0;
M2 = (1+u) .* (1-v) / 4.0;
M3 = (1+u) .* (1+v) / 4.0;
M4 = (1-u) .* (1+v) / 4.0;

Xq = zeros(Ng,3);
J  = zeros(Ng,1);
for ii = 1:Ng
    
    Xq(ii,:) = M1(ii) .* X1 + M2(ii) .* X2 + M3(ii) .* X3 + M4(ii) .* X4;
    P = [-(1-v(ii))/4.0  (1-v(ii))/4.0 (1+v(ii))/4.0 -(1+v(ii))/4.0;
         -(1-u(ii))/4.0 -(1+u(ii))/4.0 (1+u(ii))/4.0  (1-u(ii))/4.0];
    PX = P * XX;
    t1 = PX(1,:);
    t2 = PX(2,:);
    J(ii) = norm(cross(t1,t2));
         
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

Mij = sum(w .* J .* RG_Rn);
Lij = sum(w .* J .* G    );

end