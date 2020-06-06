function u = ext_median2(P)
%Computes the extrinsic median on data on the unit sphere using Matlab
%minimization. 
P=P'; 
n=size(P,1);
ssr = @(phi)ext_median_obj(phi,P);
phi0=zeros(1,n-1);
options=optimset('TolFun',1e-7);
phi = fminunc(ssr,phi0,options);
phi(n)=0;
u=zeros(1,n);
for i=1:n
     vt=ones(1,n-1);
    for j=1:i-1
        vt(j)=sin(phi(j));
    end;
    vt(i)=cos(phi(i));
    vt=vt(1:n-1);
    u(i)=prod(vt);
end;