function A_T = AreaOfPanel( X1,X2,X3 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

e12 = X2 - X1;
e13 = X3 - X1;

A_T = .5 * norm(cross(e12,e13));

end

