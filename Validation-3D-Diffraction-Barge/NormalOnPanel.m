function n_B = NormalOnPanel( V1,V2,V4 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

r12 = V2 - V1;
r14 = V4 - V1;

n_B = cross(r12,r14) / norm(cross(r12,r14));

end

