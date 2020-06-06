mu = [1 0 0];
%Sample from the VonMisesFisher Distribution and plot points 
D=randvonMisesFisherm(3,55,30,mu); 
D=D';
SpherePlot(D,'b'); 
hold on; 
plot3(mu(1),mu(2),mu(3),'marker','.','markersize',20,'color','g');
%Plot 5 outliers 
k=0; 
d=pi/6; eps=.05; 
outliers=zeros(5,3); 
for theta = 0:pi/8:pi/2
    k=k+1;
    outliers(k,:)=cos(d+eps)*mu+sin(d+eps)*[0 cos(theta) sin(theta)];
end
SpherePlot(outliers,'r'); hold on; 
D=[D; outliers]; 
%Plot confidence interval 
a=length(0:.01:2*pi); 
CIpts=zeros(a,3); 
k=0; 
for theta = 0:.01:2*pi 
    k=k+1;
    CIpts(k,:)=cos(d)*mu+sin(d)*[0 cos(theta) sin(theta)];
end
for j=1:a
     plot3(CIpts(j,1),CIpts(j,2),CIpts(j,3),'marker','.','markersize',5,'color','b');
end
ui=zeros(5,3);
%Find means of 5 random groups of data 
D=datasample(D,60,'Replace',false);
for i=1:5
    ui(i,:)=int_mean(D(12*i-11:11*i,:));
end 
SpherePlot(ui,'y'); hold on; 
%Find and plot geometric median of 5 random groups of data 
us = int_median(ui);
plot3(us(1),us(2),us(3),'marker','.','markersize',20,'color','m');
