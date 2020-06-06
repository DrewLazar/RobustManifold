function m = ext_mean(P)
%Extrinsic mean on d sphere - int_mean(P)
%Returns the extrinsic mean on the d sphere of the data, P, in an n by d+1
%matrix. 
P=P';
    m=mean(P,2)/norm(mean(P,2),2);
    m=m';
end
