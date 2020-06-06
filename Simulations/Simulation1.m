%find outliers of the VMF distribution;
%distance of "95th percentile" from the u=[0,0,1];  
% fun = @(x) etafun(3,x,30) - .95;
% fzero(fun,pi/15); 
%k is number of outliers; m is number of groups; Sample size of 60; 
%Phi is approx distance of 95% outlier%
nl=100; k=5; rd=60-k; m=12; phi=pi/4;  
%1200 loops, a will be distances of us to u and b will be distances of 
a=zeros(1,100); b=zeros(1,100); 
for i=1:nl
%Generate k outliers at distance phi from u=[0,0,1]; 
v=zeros(k,3); 
for j=1:k
    ang=(j-1)*(pi/(2*(k-1)));
    v(j,:)=cos(ang)*[0,1,0]+sin(ang)*[0,0,1]; 
end
w=zeros(k,3); 
for j=1:k
    w(j,:)=cos(phi)*[1,0,0]+sin(phi)*v(j,:); 
end 
  %generate 60 data points in S_2 with 60-k from VMF distribution 
kappa=30; u=[1,0,0];  
D1=randvonMisesFisherm(3,rd,kappa,u);
D=[D1';w]; D=datasample(D,60,'Replace',false);
  %Divide data into m groups and find means of each group and store in ui. 
ui=zeros(m,3); 
for k=1:m
    g=(60/m)*(k-1)+1; h=(60/m)*k; 
    ui(k,:)=int_mean(D(g:h,:));
end
%Find the median of means and the distance to u 
us=int_median(ui); 
a(i)=geo_dis(u,us); 
%Find the average distance of the uis to u  
b(i)=mean(geo_dis(ui,u)); 
end 
avg_us=mean(a);  avg_ui=mean(b); 
    
    
