function [ BCINDEX,Phi,dPhi_dn,m3,n3,m4,n4 ] = ...
    DiffractionBC3D...
    ( NoP,Bottom,Lateral,FS,Body,RCP,Wave,H_D,n_B)
%This function Implements Boundary conditions for 3-Dimensional Diffraction

%  INPUT ::
%          NoP    :: Number of Panels
%          Wave    :: Struct Containing Characteristics of the Incident Wave
%          Bottom  :: Indices of Panels which are located on Bottom face
%          Lateral :: Indices of Panels which are located on Radius of the Doamin
%          Body    :: Indices of Panels which are located on Body faces
%          FS      :: Indices of Panels which are located on Free Surface
%  OUTPUT ::
%           BCINDEX :: Vector for Boundary Condition Index at each Panel
%                      1 = if Flux is Prescribed        (Neumann B.C.)
%                      0 = if Potential is Prescibed    (Drichlet B.C.)
%                      2 = if they have Linear relation (Newton B.C.)
%           Phi     :: Constant Potential at each Panel
%           dPhi_dn :: Constant Flux at each Panel
%           m,n     :: constant of Newton B.C.
%                      dPhi_dn = m * Phi + n
%   Other ::
%           Phi_Bottom,Phi_Top,dPhidn_Lateral :: Prescribed Values of B.C.

% Set Prescribed Values for B.C. (from Physics of the Problem)

global g;
w = Wave.Frequency;
k = Wave.Number;

m4 = w^2 / g;
n4 = 0;
m3 = 1i*k;
n3 = 0;
dPhidn_Bottom = 0.0;

% describe whether Potential(0) or Flux(1) is known on each Panel or there
% is a linear relation ship between these two (2)

BCINDEX = zeros(NoP,1);

BCINDEX(FS     ) = 2;
BCINDEX(Bottom ) = 1;
BCINDEX(Lateral) = 2;
BCINDEX(Body   ) = 1;

%Set Value of B.C. on each Panel
Phi     = zeros(NoP,1);
dPhi_dn = zeros(NoP,1);

dPhi_dn(Body) = - LinearWaveFlux( Wave,H_D,RCP(Body,1),RCP(Body,2),RCP(Body,3),n_B );
dPhi_dn(Bottom) = dPhidn_Bottom;

end

