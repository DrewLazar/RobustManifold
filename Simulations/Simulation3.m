%Generate k outliners in S^2; m is number of groups; 
for i=1:100
k=15; rd=60-k; 
for j=1:k
    ang=(j-1)*(pi/(2*(k-1)));
    v(j,:)=cos(ang)*[0,1,0]+sin(ang)*[0,0,1]; 
end
phi=pi/4; %Distance of outlier%  
% phi=.5; 
for j=1:k
    w(j,:)=cos(phi)*[1,0,0]+sin(phi)*v(j,:); 
end 
kappa=30; e1=[1,0,0]; 
Y=randvonMisesFisherm(3,rd,kappa,e1); Y=Y'; 
D=[Y;w]; D=datasample(D,60,'Replace',false); 
b=0; 
for m=[1 2 5 10 15 30 60]
    b=b+1; 
u=zeros(m,3); 
for k=1:m
    g=(60/m)*(k-1)+1; h=(60/m)*k; 
    if m<60
        u(k,:)=ext_mean(D(g:h,:)); 
    else
        u(k,:)=D(g:h,:);
    end
end
s=size(u); 
if s(1)==1 
    anw=u; 
else
    anw=ext_median(u);
end
d1(b,i)=geo_dis(anw,e1); 
y=zeros(1,m); 
for j=1:m
    y(j)=geo_dis(e1,u(j,:));
end
d2(b,i)=mean(y); 
end
end
a1=mean(d1,2); a2=mean(d2,2); 