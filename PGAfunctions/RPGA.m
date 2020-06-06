function est2a = RPGA(P,m,h)
%P is the data in PD(3), m is the number of groups, h is the number of 
%RPGA directions
[~,~,N]=size(P); 
a=length(P(:,:,1)); 
b=N/m;
%Divide data into m groups and find the instrinsic median of each group 
A=zeros(a,a,m); 
for j=1:m
        A(:,:,j)=int_mean_damp(P(:,:,(j-1)*b+1:j*b)); 
end
%Find the median of the means 
us=int_median(A); 
%Shift back to eye(3) by isometry and do Minsker Robust PGA at eye(3) 
gi = expm(-(1/2)*logm(us));
g= expm((1/2)*logm(us));
Pn=zeros(a,a,N); 
for i=1:N
    Pn(:,:,i)=gi*P(:,:,i)*gi;
end
for k = 1:N
    D1(:,:,k)=logm(Pn(:,:,k));
    D(k,:)=vecfsyiso(D1(:,:,k)); 
end
est=Minsk_PCA(m,D);
%Shift back to us to get Robust PGA directions 
r=a*(a+1)/2; 
for k=1:r
est2(:,:,k)=g*vec2syiso(est(:,r+1-k))*g;
end
est2a=est2(:,:,1:h); 

 

