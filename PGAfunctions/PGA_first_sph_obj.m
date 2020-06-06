 function [ssr] = PGA_first_sph_obj(phi,D,N)
%PGA first direction unit sphere objective - PGA_first_sph_obj(D)
%Given coordinates of tangent vector in unit sphere parameterization, phi,
%data, P, and amount of data N, returns the sum of squares residuals of the
%data to projection to exponentiated span of tangent vector. 

%Phi to Cartestian coordinates
M=sph_to_cart(phi,1);
%Find the sum of squared-residuals
d=zeros(1,N);
   parfor i = 1:N;
    d(i) = proj_geo_min(M,D(:,:,i));
    end;
    ssr=(1/N)*(d*d');
end


