function [ Mii,Lii ] = MLSingularElement( Xp,X1,X2,X3 )
%This function evaluates singular element of "M" Matrix and "L" Matrix
%"M" Matrix includes Normal derivetive of Green function; R_G/R_n
%"L" Matrix includes Green function; G
%Note that --> (M+0.5*I) * phi = L * phi_n
%Note that --> Xp is coplanar with the triangle and lies withn it

%   INPUT ::
%           X1,X2,X3 :: three corners of the triangular element, marked CCW
%           Xp       :: Load point, which lies with in the triangle
%   OUTPUT ::
%            Mii :: ii-th (diagonal) element of "M" matrix
%            Lii :: ii-th (diagonal) element of "L" matrix
%   Other ::
%            A_T :: area of the triangle
%            e   :: distance between consecutive vertices of triangle
%                   e(ii,:) = distance vector between vertice ii+1 and ii
%            a   :: magnitude of the edeges of the triangle
%            n   :: unit vector of each edge
%            r   :: distance vector between Load point and each vertex of
%                   triangle          

e2 = X2 - X1; 
e3 = X3 - X1;
A_T = 0.5 * norm(cross(e2,e3));

e = zeros(3,3);
e(1,:) = X2 - X1;
e(2,:) = X3 - X2;
e(3,:) = X1 - X3;

a = zeros(3,1);
for ii = 1:3
    a(ii) = norm(e(ii,:));
end

n = zeros(3,3);
for ii = 1:3
    n(ii,:) = e(ii,:) / a(ii);
end

r = zeros(3,3);
r(1,:) = X1 - Xp;
r(2,:) = X2 - Xp;
r(3,:) = X3 - Xp;

Lk = zeros(3,1);
for ii = 1:3
    if ( ii==3 )
        num   = norm(r(1 ,:)) + dot(r(1 ,:),n(ii,:));
        denum = norm(r(ii,:)) + dot(r(ii,:),n(ii,:));
    else
        num   = norm(r(ii+1,:)) + dot(r(ii+1,:),n(ii,:));
        denum = norm(r(ii  ,:)) + dot(r(ii  ,:),n(ii,:));
    end
    Lk(ii) = log(num / denum);
end
    
Lii = (A_T * sum(Lk ./ a)) / (6.0 * pi);
Mii = 0.0;

end

