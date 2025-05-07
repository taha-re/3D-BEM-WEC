function n_T = NormalOnPanel( X1,X2,X3 )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

e12 = X2 - X1;
e13 = X3 - X1;

n_T = cross(e12,e13) / norm(cross(e12,e13)); 

end

