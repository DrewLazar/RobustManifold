function SSR = PGA_mth_sph_obj(phi,D,Vi,B,N)
%PGA mth direction unit sphere objective - PGA_mth_sph_obj(phi,D,Vi,B,N)
%Given coordinates of tangent vector in unit sphere parameterization, phi,
%in suspace spanned by B, data D, amount of data N, and orthonormal set Vi
%returns the sum of squares residuals of the data to projection to 
%exponentiated span of submanifold determined by Vi and phi. 

[~,~,s] = size(Vi);

%Return coordinates phi in basis B as a symmetric matrix
    v=sph_to_cart(phi,B);
%Form space whose exponentiated span you will project to
    Vi(:,:,s+1) = v;
%Commpute ssr
d=zeros(1,N);
    parfor i = 1:N
        d(i) = projection(Vi,D(:,:,i));
    end
SSR=(1/N)*(d*d');
end


