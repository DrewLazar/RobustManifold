function m = ext_median(P)
%Extrinsic mean on d sphere - int_mean(P)
%Returns the extrinsic mean on the d sphere of the data, P, in an N by n=d+1
%matrix. 
[N,n]=size(P); 
%Initial guess
a = int_median_euc(P);
    m=a/norm(a);
%Save guess for comparison
mo=m; 
%Form initial gradient from Weiszfeld's Algorithm, g
d=zeros(N,1); 
for k=1:N
    d(k)=norm(m-P(k,:));
end;
S = zeros(N,n);
for k=1:N
    a=1/d(k); 
   S(k,:)=a*(m-P(k,:));
end;
g=(1/sum(1./d))*sum(S,1);
%Project initial gradient into tangent space at m
A = null(m);
proj = g*(A*A');
%Exponentiate proj at m to get second guess
m=Sph_Exp(m,-proj);
st=norm(mo-m);
while st > 1e-5
    mo=m; 
%Form next gradient from Weiszfeld's Algoritm, g
d=zeros(N,1); 
for k=1:N
    d(k)=norm(m-P(k,:));
end;
S = zeros(N,n);
for k=1:N
    a=1/d(k); 
   S(k,:)=a*(m-P(k,:));
end;
g=(1/sum(1./d))*sum(S,1);
%Project next gradient into tangent space at m
A = null(m);
proj = g*(A*A');
%Exponentiate proj at m to get next guess
m=Sph_Exp(m,-proj);
st=norm(mo-m);
end