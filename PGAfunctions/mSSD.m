function d = mSSD(V,P)
n=length(P);
u=int_mean_damp(P); 
a=zeros(1,n); 
for k=1:n
    a(k)=projection_nc(V,P(:,:,k),u);
end
d=(1/n)*sum(a.^2);
