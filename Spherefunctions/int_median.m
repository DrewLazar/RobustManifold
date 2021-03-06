function u = int_median(P)
%Intrinsic mean on d sphere - int_mean(P)
%Returns the intrinsic mean on the d sphere of the data, P, in an n by d+1
%matrix. 
P=P';
if size(P,2) == 1; u=P';
else
     x=mean(P,2)/norm(mean(P,2),2);
    z = 1;
    while z > 1e-24
        x0 = x;
        x = int_median_fun(x,P);
        z = (x-x0)'*(x-x0);
    end
    u = x';
end