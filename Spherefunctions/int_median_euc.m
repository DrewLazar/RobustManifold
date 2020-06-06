function m = int_median_euc(P)
[N,n]=size(P); 
%Initial guess - Intrinsic mean
m = mean(P,1); 
%Update initial guess
d=zeros(N,1); 
for k=1:N
    d(k)=norm(m-P(k,:));
end;
S = zeros(N,n);
for k=1:N
    a=1/d(k); 
   S(k,:)=a*(m-P(k,:));
end;
G=(1/sum(1./d))*sum(S,1);
m=m-G; 
st=norm(G);
while st>1e-15
d=zeros(N,1); 
for k=1:N
    d(k)=norm(m-P(k,:));
end;
S = zeros(N,n);
for k=1:N
    a=1/d(k); 
   S(k,:)=a*(m-P(k,:));
end;
G=(1/sum(1./d))*sum(S,1);
m=m-G; 
st=norm(G);
end;
end   