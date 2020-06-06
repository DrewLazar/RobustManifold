function w = sph_to_cart(phi,B)
%Spherical to cartesian coordinates - sph_to_cart(v,B)
%Given sphereical coordinates in basis B returns the symmetric matrix in cart
%coords. Second argument 1, to use canoncical bases of tangent space at I. 

n=length(phi)+1;
phi(n)=0;
v=zeros(1,n);
for i=1:n
     vt=ones(1,n-1);
    for j=1:i-1
        vt(j)=sin(phi(j));
    end;
    vt(i)=cos(phi(i));
    vt=vt(1:n-1);
    v(i)=prod(vt);
end;
    if isequal(B,1)==0
         w=0;
        for i=1:n
        w=w+ v(i)*B(:,:,i);
        end;
    else
        w=vec2syiso(v);
    end;
end
    