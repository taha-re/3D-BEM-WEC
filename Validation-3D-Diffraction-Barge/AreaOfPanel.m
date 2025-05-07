function A_Panel = AreaOfPanel( V1,V2,V3,V4 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

r12 = V2 - V1;
r14 = V4 - V1;

r34 = V4 - V3;
r32 = V2 - V3;

A1 = .5 * norm(cross(r12,r14));
A2 = .5 * norm(cross(r34,r32));

A_Panel = A1 + A2;

end

