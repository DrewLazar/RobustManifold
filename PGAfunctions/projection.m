function [d,c]=projection(V,p)
%proj - [d c]=proj(V,p)
%Given V= v_1,...,v_n, where V subset of T_I P(n) 
%finds the coefficients c = c_1,...,c_n, that minimize the geodesic distance  
%of expm(c_1*v1+...+c_n*v_n) to p and returns c and the distance, d.  

[~,~,n]=size(V);
t=length(V(:,:,1));

%An initial guess for c, c0
    c0=zeros(1,n);
    for i=1:n
        c0(i) = Riemann_met_Id(V(:,:,i),logm(p));
    end

%Use minimization routine with user-supplied gradient to find c. 
options = optimset('GradObj','on','TolFun',1e-22,'Display','off');
c = fminunc(@(c)projection_obj(V,p,c,n,t),c0,options);

%Calculate d
    S=zeros(t,t);
    for i=1:n
        S=c(i)*V(:,:,i)+S;
    end
    proj=expm(S);
    d = geo_dis(p,proj);
    

