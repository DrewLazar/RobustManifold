%Generate a outliners in P(3); m is number of groups; 
for i=1:200
a=15; 
dis=sqrt(3*chi2inv(.95,6)/4); 
D=gen_data(60,a,dis); 
b=0; 
for m=[1 2 5 10 15 30 60]
    b=b+1; 
    ui=zeros(3,3,m); 
for k=1:m
    g=(60/m)*(k-1)+1; h=(60/m)*k; 
    if m<60
        ui(:,:,k)=int_mean_damp(D(:,:,g:h)); 
    else
        ui(:,:,k)=D(:,:,g:h);
    end
end
us=int_median(ui);  
d1(b,i)=geo_dis(us,eye(3)); 
y=zeros(1,m); 
for j=1:m
    y(j)=geo_dis(eye(3),ui(:,:,j));
end
d2(b,i)=mean(y); 
end
end
a1=mean(d1,2); a2=mean(d2,2); 
 

