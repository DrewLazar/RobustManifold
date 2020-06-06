%find outliers of the VMF distribution;
%distance of "95th percentile". 
% % fun = @(x) etafun(3,x,30) - .95;
% fzero(fun,pi/15); 
nl=5; d1=zeros(6,nl);d2=zeros(6,nl);  
for i=1:nl
u=zeros(1,6); u(1)=1; e2=zeros(1,6); e2(2)=1; e3=zeros(1,6); e3(3)=1; 
%Generate k outliners in S^7; m is number of groups; 
k=40; rd=200-k; 
v=zeros(k,6); 
for j=1:k    
    ang=(j-1)*(pi/(2*(k-1)));
    v(j,:)=cos(ang)*e2+sin(ang)*e3; 
end
% phi is distance of outlier 
phi= 0.85 ; 
w=zeros(k,6); 
for j=1:k
    w(j,:)=cos(phi)*u+sin(phi)*v(j,:); 
end 
%Generate data from VonMisesFisher Distribution 
kappa=20; 
Y=randvonMisesFisherm(6,rd,kappa,u); Y=Y'; 
D=[Y;w]; D=datasample(D,200,'Replace',false); 
%Find mean for each of the m groups, median of means, distance of median of 
%means to u, average of distances of each mean to u 
b=0; 
for m=[1 2 10 50 100 200]
    b=b+1; 
ui=zeros(m,6); 
for k=1:m
    g=(200/m)*(k-1)+1; h=(200/m)*k; 
    if m<200
        ui(k,:)=int_mean(D(g:h,:)); 
    else
        ui(k,:)=D(g:h,:);
    end
end
us=int_median(ui);  
d1(b,i)=geo_dis(us,u); 
y=zeros(1,m); 
for j=1:m
    y(j)=geo_dis(u,ui(j,:));
end
d2(b,i)=mean(y); 
end
end
a1=mean(d1,2); a2=mean(d2,2); 