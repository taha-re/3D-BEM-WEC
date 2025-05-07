%Main Program For Radiation problem on a 3D Cylinder
%% Wave and Structure Constants
%   g       :: Gravity Acceleration
%   rho     :: Density of Sea Water
%   Ka      :: Dimensional Wave Number (= K * a)
%   a       :: Mesh Scale
%   D_B,L_B
%   ,B_B    :: Draft,Length and Beam of the Barge
%   H_D,R_D :: Depth of the Sea,Radius of the Domain
%   m_Body  :: Mass of the Body
%   Wave    :: Struct Containing Characteristics of the Incident Wave
%   Bottom  :: Indices of Panels which are located on Bottom face
%   Lateral :: Indices of Panels which are located on Radius of the Doamin
%   Body    :: Indices of Panels which are located on Body faces
%   FS      :: Indices of Panels which are located on Free Surface
%   VERTEX  :: the coordinates of each Vertex 
%              --> VERTEX(i,:) = (x(i),y(i),z(i))
%   EPV     :: number of vertices of each panel. Marking is done CCW.
clc;
clear all;
tic;
global g;
global rho;
g = 9.8;
rho = 1000;

Ka = 1;
a_B = 10;
D_B = .5 * a_B;

R_D = 5 * a_B;
H_D = a_B;

Wave = struct('Frequency',sqrt(Ka * g / a_B));

myfun = @(k) Wave.Frequency^2 - g * k * tanh( k * H_D);
k = fsolve(myfun,0.05);
Wave.Number = k;

Wave.Length = 2*pi/Wave.Number;

[ VERTEX,EPV,NoP,NoV,...
    FS,Body,Lateral,Bottom ] = MeshPostProcessing(R_D,H_D);
close;

%% Computing Influence Coefficient Matrix
%   M,L     :: Discrite Laplace Operators
%              M = integrate(RG_Rn), L = integrate(G)
%              (M + C) * Phi = L * dPhi_dn
%   RCP     :: Position Vector of Collocation points for each Panel
%   A_Panle :: Area of each Panel
%   G,H     :: Influence Matrix (H * Phi = G * dPhi_dn)

M = zeros(NoP,NoP);
L = zeros(NoP,NoP);

% position vector of Colocation points
RCP = zeros(NoP,3);
A_Panel = zeros(NoP,1);

% Loop on Load (Node) Panel
for ii=1:NoP
    
    V1 = VERTEX(EPV(ii,1),:);
    V2 = VERTEX(EPV(ii,2),:);
    V3 = VERTEX(EPV(ii,3),:);
    Xp = (V1 + V2 + V3) ./ 3.0;
    RCP(ii,:) = Xp;
    
    A_Panel(ii) = AreaOfPanel( V1,V2,V3 );
    
    % Loop on Feild (Node) Panel
    for jj=1:NoP
        
        X1 = VERTEX(EPV(jj,1),:);
        X2 = VERTEX(EPV(jj,2),:);
        X3 = VERTEX(EPV(jj,3),:);
        
        if ( jj~=ii )
            [ M(ii,jj),L(ii,jj) ] = MLRegularElement( Xp,X1,X2,X3 );
        elseif ( jj==ii )
            [ M(ii,jj),L(ii,jj) ] = MLSingularElement( Xp,X1,X2,X3 );
        end
        
        fprintf('Load Panel: %f; Field Panel: %f\n',ii,jj);
    end
    
end

% discerit form of integral equation :: H * Phi = G * dPhi_dn

H = M + .5 .* eye(size(M,1));
G = L;

%% Computing normal Vectors "in" to the Surface of the Body
%   n_B :: Normal Vector of Body Panels

n_B = zeros(size(Body,1),3);

for ii=1:size(Body,1)
    
    X1 = VERTEX(EPV(Body(ii),1),:);
    X2 = VERTEX(EPV(Body(ii),2),:);
    X3 = VERTEX(EPV(Body(ii),3),:);
    
    n_B(ii,:) = NormalOnPanel( X1,X2,X3 );
    
end

%% Set Boundary Conditions
%   BCINDEX :: Vector for Boundary Condition Index at each Panel
%              1 = if Flux is Prescribed        (Neumann B.C.)
%              0 = if Potential is Prescibed    (Drichlet B.C.)
%              2 = if they have Linear relation (Newton B.C.)
%   Phi     :: Constant Potential at each Panel
%   dPhi_dn :: Constant Flux at each Panel
%
%   m,n     :: constant of Newton B.C. (dPhi_dn = m * Phi + n)
%              4 = Free Surface; 3 = Lateral

[ BCINDEX,Phi,dPhi_dn,m3,n3,m4,n4 ] = ...
    RadiationBC3D...
    ( NoP,Bottom,Lateral,FS,Body,Wave,n_B);

%% Solution of Radiation Problem
% Reordering LHS and RHS Matrices
% All Knowns will be shifted to Right hand side and
% All unKnowns to the Left Hand side

A_Star = zeros(NoP,NoP); B_Star = zeros(NoP,NoP); C_Star = zeros(NoP,1);
for ii=1:NoP
    if ( BCINDEX(ii)==1 ) % Prescribed Flux (dPhi_dn)
        A_Star(:,ii) = H(:,ii);
        C_Star(  ii) = dPhi_dn(ii);
        B_Star(:,ii) = G(:,ii);
    elseif ( BCINDEX(ii)==0 ); % Prescribed Potential (Phi)
        A_Star(:,ii) = -G(:,ii);
        C_Star(  ii) = Phi(ii);
        B_Star(:,ii) = -H(:,ii);
    elseif ( BCINDEX(ii)==2 )
        if (ismember(ii,FS))
            A_Star(:,ii) = H(:,ii) - m4 .* G(:,ii);
            C_Star(  ii) = n4;
            B_Star(:,ii) = G(:,ii);
        elseif (ismember(ii,Lateral))
            A_Star(:,ii) = H(:,ii) - m3 .* G(:,ii);
            C_Star(  ii) = n3;
            B_Star(:,ii) = G(:,ii);
        end
    end
end

%% Solution of System of Equation
%   A,B   :: LHS and RHS Matrices of System of equation (AX=B)
%   sol   :: Solution Vector of the System (X)
%   Phi_D :: Diffraction Potential on Body

A = A_Star;
B = B_Star * C_Star;

sol = gmres(A,B,12,[],100);

for ii=1:NoP
    if( BCINDEX(ii)==1 )
        Phi(ii) = sol(ii);
    elseif ( BCINDEX(ii)==0 )
        dPhi_dn(ii) = sol(ii);
    elseif ( BCINDEX(ii)==2 )
        if (ismember(ii,FS))
            Phi(ii) = sol(ii);
            dPhi_dn(ii) = m4 * Phi(ii) + n4;
        elseif (ismember(ii,Lateral))
            Phi(ii) = sol(ii);
            dPhi_dn(ii) = m3 * Phi(ii) + n3;
        end
    end
end

Phi_R = Phi(Body);

%% Computing Added Mass and Radiation Damping
w = Wave.Frequency;

sum1 = Phi_R .* dPhi_dn(Body) .* A_Panel(Body);
sum1 = sum(sum1);

mu  = -rho * real(sum1) / w^2;
lam = rho * imag(sum1) /w;

denum = rho * a_B^3;

C_m = mu / denum;
C_d = lam / (denum * w);

fprintf('Non-Dimensional Added Mass = %.18f \n',C_m);
fprintf('Non-Dimensional Damping    = %.18f \n',C_d);

toc;