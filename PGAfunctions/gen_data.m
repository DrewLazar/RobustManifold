function D = gen_data(n,no,dis)
%n the amount of Data in PD(3), no is the number of outliers, dis is the
%distance of outliers from u=eye(3); 
for i=1:n-no
mu=zeros(6,1); sigma=eye(6); x=mvnrnd(mu,sigma);
Y(:,:,i)=expm(vec2syiso(x));
end
if no == 0
    D=Y; 
else
    %Generate no outliers 
e1=zeros(1,6); e1(1)=1; e2=zeros(1,6); e2(2)=1; 
e3=zeros(1,6); e3(3)=1; 
for j=1:ceil(no/2)
    wo(2*j-1,:)=dis*(cos(pi/(2*j-1))).*e1+dis*sin(pi/(2*j-1)).*e2;
    wo(2*j,:)=dis*(cos(pi/(2*j-1))).*e1+dis*sin(pi/(2*j-1)).*e3;
end
if mod(no,2)==1
    wo(j,:)=[ ];
end
for j=1:no
    w(:,:,j)=expm(vec2symmat(wo(j,:)));
end
%Add outliers to data 
D=cat(3,Y,w);
end
