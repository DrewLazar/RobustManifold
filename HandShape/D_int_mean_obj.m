function ds = D_int_mean_obj(phi,S,B,k)
phi(2*k-2)=0;
x=zeros(1,2*k-2);
for i=1:2*k-2
     vt=ones(1,2*k-3);
    for j=1:i-1
        vt(j)=sin(phi(j));
    end;
    vt(i)=cos(phi(i));
    vt=vt(1:2*k-3);
    x(i)=prod(vt);
end;
    C = B(1:k,:)*x' + 1i*B(k+1:2*k,:)*x';
    ds = sum((acos(abs(S'*C))).^2);
end
  



