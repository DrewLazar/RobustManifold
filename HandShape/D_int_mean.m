function u = D_int_mean(S)
%Find intrisic mean of planar shapes on pre-shape sphere. S is a k by N
%complex matrix with each column a pre-shape on the sphere in H^{k-1}. 
[k,~] = size(S);
%Find an orthogonal basis for H^{k-1}
a=ones(1,k);
b=zeros(1,k);
B=null([[a b];[b a]]);
ssr = @(phi)D_int_mean_obj(phi,S,B,k);
phi0=zeros(1,2*k-3);
options=optimset('TolFun',1e-48,'GradObj','off');
phi = fminunc(ssr,phi0,options);
phi(2*k-2)=0;
x=zeros(1,2*k-2);
for i=1:2*k-2
     vt=ones(1,2*k-3);
    for j=1:i-1
        vt(j)=sin(phi(j));
    end;
    vt(i)=cos(phi(i));
    vt=vt(1:2*k-3);
    x(i)=prod(vt);
end;
ur=B*x';
u=zeros(k,1); 
 for l=1:k
        u(l)=ur(l)+1i*ur(k+l);
 end;
 

   