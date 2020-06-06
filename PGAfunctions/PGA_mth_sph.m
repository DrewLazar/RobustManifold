function [V,times] = PGA_mth_sph(D,m,~)
%PGA mth_direction unit sphere - PGA_mth_sph(P,1)
%Finds the first m principal geodesic directions of data, P and computation
%times. Candidate directions are on unit spheres in subspaces of tangent 
%space at I. Third argument 1 if P does not have mean at I. 

n=length(D(:,:,1));
N=length(D);

%Demeans data and decomposes mean to gg if D does not have mean I     
    if nargin == 3
       [D,g]= Gamma(D);
    end
%Array,V that will contain PGA directions
    V = zeros(n,n,m);
%Vector will contain computation times
    times=zeros(1,m);
%Find first PGA direction and computation time
    t0 = clock;
    V(:,:,1)=PGA_first_sph(D);
    times(1)=etime(clock, t0);
%Find the second through mth PGA directions and computation times
    for i = 2:m
       %Computation time
       t0 = clock; 
       %Find basis, B for the orthogonal complement of span of previous'
       %directions
          Vi = V(:,:,1:i-1);
          B=orth_comp_basis(Vi);
       %Find first PCA of data projected into orthogonal complement of span 
       %of previous directions as initial guess, phig
          vg = LPGA_sub(D,B);
          phig = cart_to_sph(vg,B);
       %Define function of spherical coordinates, phi, that returns ssr of
       %P projected to submanifold derived from Vi and phi. 
          fun = @(phi)PGA_mth_sph_obj(phi,D,Vi,B,N);
          options = optimset('GradObj','off','Display','off','TolFun',1e-12);
       %Specify constraints for phi
          r=length(phig);
          lb=zeros(1,r);ub=pi*ones(1,r-1);ub(r)=2*pi;
       %Find the ith pga direction by minimizing ssr as in objective 
       %function
          [phi0, ~]= fmincon(fun,phig,[],[],[],[],lb,ub,[],options);
          vi=sph_to_cart(phi0,B);
          V(:,:,i)=vi;
        %Computation time for ith direction
        times(i)=etime(clock, t0);
    end
%Shift PGA directions in V back to tangent space at mean if mean not I. 
    if nargin==3
        for i=1:m
           V(:,:,i)=g*V(:,:,i)*g;
        end
    end
%Cumulative computation times
times=cumsum(times);
end
    