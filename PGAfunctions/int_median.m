function m = int_median(P)
[~,n,N] = size(P);
%Initial guess
m = eye(n);
%Update initial guess
d=zeros(N,1); 
for k=1:N
    d(k)=geo_dis(m,P(:,:,k));
end
S = zeros(n,n,N);
for k=1:N
    a=1/d(k); 
   S(:,:,k)=a*Mat_log(m,P(:,:,k));
end
v=(1/sum(1./d))*sum(S,3);
mn=Mat_exp(m,v);
st=geo_dis(m,mn);
while st>1e-9
    m=mn;
    d=zeros(N,1); 
for k=1:N
    d(k)=geo_dis(m,P(:,:,k));
end
S = zeros(n,n,N);
for k=1:N
    a=1/d(k); 
   S(:,:,k)=a*Mat_log(m,P(:,:,k));
end
v=(1/sum(1./d))*sum(S,3);
mn=Mat_exp(m,v);
st=geo_dis(m,mn);
end
end