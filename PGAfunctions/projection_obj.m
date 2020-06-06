function [ds,g] = projection_obj(V,p,c,n,t)
%Projection objective - [d g] = proj_obj(V,p,c)
%Return the square of the distance, ds, of p to expm(c1*v1+..+cn*vn) where 
%v1,...,vm are the vectors in V and c1,...,cm are 
%coefficients in c. g is the value of the gradient condition
%,g. 

%Calculate square of distance,ds
    w=zeros(t,t);
    for i=1:n
        w=c(i)*V(:,:,i)+w;
    end
    d = geo_dis(p,expm(w));
    ds=d^2;
%Calculate the value of the gradient, g at w. 
a=Mat_log(expm(w),p);
g=zeros(1,n);
for i = 1:n
    T= DExp(w,V(:,:,i));
    g(i)=-(1/n)*Riemann_met(expm(w),T,a);
end
