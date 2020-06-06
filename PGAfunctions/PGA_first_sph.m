function [v1] = PGA_first_sph(P,~)
%PGA first direction unit sphere - PGA_sphere_first(P)
%Finds the first principal geodesic direction of data, P. Candidate
%directions are on unit sphere in tangents space at I. 
%Second argument 1 if P does not have mean at I. 

N = length(P);

%Demeans data and decomposes mean to gg if P does not have mean I     
    if nargin==2
        [P,g] = Gamma(P);
    end
%Define anonymous function that returns SSR for phi
    fun = @(phi)PGA_first_sph_obj(phi,P,N);
%Initial guess, phig, as the first LPGA direction in spherical coordinates
    vg = LPGA(P,1);
    phig=cart_to_sph(vg,1);
%Constraints for phi in optimization
    s=length(phig);
    lb=zeros(1,s);ub=pi*ones(1,s-1);ub(s)=2*pi;
%Minimize objective function with constraints
    options = optimset('GradObj','off','Display','off','TolFun',1e-12);
    [phi0, ~]= fmincon(fun,phig,[],[],[],[],lb,ub,[],options);
%Give solution in cartesian coordinates
    if nargin==2 
        v1 = g*sph_to_cart(phi0,1)*g;
    else
        v1 = sph_to_cart(phi0,1);
    end
end
