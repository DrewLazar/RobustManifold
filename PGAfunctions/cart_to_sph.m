function phi = cart_to_sph(v,B)
%Cartestian to spherical coordinates - cart_to_sph(v,B)
%Given symmetric matrix, v, returns the sphereical coordinates in basis B
%Second argument 1, to use canoncical bases of tangent space at I. 

    if isequal(B,1)==0
         m=length(B);
        w=zeros(1,m);
        for i=1:m
        w(i)=trace(v*B(:,:,i));
        end;
        w=w';
    else 
        w=vecfsyiso(v);
        m=length(w);
    end;
phi = zeros(1,m-1);
for i=1:m-1
    a=w(m:-1:i);
    phi(i)=acos(w(i)/sqrt((a'*a)));
end;
    if w(m)<0 
       phi(m-1)=2*pi-phi(m-1);
    end;
end


