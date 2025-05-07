function [ u,v,w ] = QuadGaussPoints( n )
%This function gives the points and weigths for the Gaussian quadrature
%of order "6" for a standard rectangule
%All constant derived from "HandBook of Mathematical functions"

%   INPUT :: 
%           n :: Number of Gauss Points
%   OUTPUT ::
%            u :: x_coordinates of integration points;
%            v :: y-coordinates of integration points;
%            w :: weights of integration points


if (n == 9)
    xw=[ 0.0        0.0       16/81
         sqrt(3/5)  sqrt(3/5) 25/324
        -sqrt(3/5)  sqrt(3/5) 25/324
        -sqrt(3/5) -sqrt(3/5) 25/324
         sqrt(3/5) -sqrt(3/5) 25/324
         0.0        sqrt(3/5) 10/81
         0.0       -sqrt(3/5) 10/81
         sqrt(3/5)  0.0       10/81
        -sqrt(3/5)  0.0       10/81];
elseif ( n==4 )
    xw=[ sqrt(1/3)  sqrt(1/3) 1/4
        -sqrt(1/3)  sqrt(1/3) 1/4
        -sqrt(1/3) -sqrt(1/3) 1/4
         sqrt(1/3) -sqrt(1/3) 1/4];
else
    error('Bad input n');
end

u = xw(:,1);
v = xw(:,2);
w = xw(:,3) .* 4;

end