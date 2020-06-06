function m = D_int_medianf(P)
[k,N] = size(P);
%Initial guess - Intrinsic mean
m = D_int_mean_damp(P);
%Update initial guess
d=zeros(N,1); 
for j=1:N
    d(j)=D_geo_dis(m,P(:,j));
end;
S=zeros(k,N); 
for j=1:N   
    a=1/d(j); 
   S(:,j)=a*D_Sph_Log(m,P(:,j));
end;
v=(1/sum(1./d))*sum(S,2);
mn=Sph_Exp(m,v);
st=D_geo_dis(m,mn);
while st>1e-15
    m=mn;
d=zeros(N,1); 
for j=1:N
    d(j)=D_geo_dis(m,P(:,j));
end;
S=zeros(k,N); 
for j=1:N   
    a=1/d(j); 
   S(:,j)=a*D_Sph_Log(m,P(:,j));
end;
v=(1/sum(1./d))*sum(S,2);
mn=Sph_Exp(m,v);
st=D_geo_dis(m,mn);
end