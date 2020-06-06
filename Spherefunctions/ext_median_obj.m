function dis = ext_median_obj(phi,P)
[n,m]=size(P);
phi(n)=0;
x=zeros(1,n);
for i=1:n
     vt=ones(1,n-1);
    for j=1:i-1
        vt(j)=sin(phi(j));
    end;
    vt(i)=cos(phi(i));
    vt=vt(1:n-1);
    x(i)=prod(vt);
end;
d=zeros(1,m);
for k=1:m
    d(k)=norm(x'-P(:,k));
end;
dis=(1/m)*sum(d);