function P = gen_dti(s,kappa)
%Generate Log Normal data in SPD(3); 
vec=kappa*((19/5)*(1:6)-14/5); vec(1)=3*kappa; 
SIGMA=diag(kappa*(vec));
D=mvnrnd(zeros(6,1),SIGMA,s);
T=zeros(3,3,s); 
for k=1:s
    T(:,:,k)=vec2syiso(D(k,:));
end
P=zeros(3,3,s);
for k=1:s
    P(:,:,k)=Mat_exp(eye(3),T(:,:,k));
end
