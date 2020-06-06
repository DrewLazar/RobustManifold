function p = D_Sph_Exp(u,v)
a=norm(v);
p=cos(a)*u + sin(a)*(v./a);
end
    