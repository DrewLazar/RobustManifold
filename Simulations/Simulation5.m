%nl is the number of loops, %m is number of groups for RPGA and $d number
%of explanatory directions (dimension of explanatory submanifold) 
nl=40; dim=3; m=15; 
%SSR_PGA will store SSR from PGA and SSR_RPGA will store SSR for RPGA. Rows
%are for # of outliers 0,5,10,15,20 and columns are for # of loops 
mSSR_PGA=zeros(5,nl); mSSR_RPGA=zeros(5,nl); 
%loop nl times 
for c=1:nl 
    %loop through h=0,5,15,15,20 outliers 
    r=0; 
    for h=0:5:20
 r=r+1; 
kappa=.1; 
n=60; 
clear P; 
%Generate data with 60 - h outliers 
P=gen_dti(60-h,.1); 
    %Add h outliers at 95% confidence interval  
    x = chi2inv(0.95,6); eps=0.3; 
    vec=kappa*((19/5)*(1:6)-14/5); vec(1)=kappa*3; 
    cov=vec(1:4);
    d=.5;
    res=d*sum(1./cov.^2); 
    res2=x-res+eps;
    outliers = zeros(h,6); 
        for k=1:h
            theta=k*(2*pi)/(h+2); 
            out=sqrt(.5)*ones(1,6); 
            out(5)=1.62*sqrt(res2)*cos(theta);
            out(6)=2*sqrt(res2)*sin(theta); 
            outliers(k,:)=out;
        end
%Add outliers to P to form PO 
PO=P;
b=60-h;
for k=1:h
PO(:,:,b+k)=expm(vec2syiso(outliers(k,:))); 
end
PO=datasample(PO,60,3,'Replace',false);   
%Find k PGA and RPGA directions with m groups for RPGA 
V1O=PGA_mth_sph(PO,dim,1); 
R1O=RPGA(PO,m,dim);
%Find SSR to data without outliers 
mSSR_PGA(r,c)=mSSD(V1O,P); mSSR_RPGA(r,c)=mSSD(R1O,P); 
    end
end
save('G15d3.mat','mSSR_PGA','mSSR_RPGA');