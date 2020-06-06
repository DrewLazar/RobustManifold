function v = D_Sph_Log(u,y)
a=abs(u'*y); 
v=acos(a)*(y-(u'*y)*u)/norm(y-(u'*y)*u);
end
    