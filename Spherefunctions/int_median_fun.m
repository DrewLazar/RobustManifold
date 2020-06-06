function r = int_median_fun(x,P)
%Intrinsic mean function - int_mean_fun(x,P)
%For data P (in n by m matrix) on the n-1 unit sphere P and x on the unit shere 
%returns the next itterative approximation of the mean based on x. 
    zeta = x'*P;
    ksi = 1./sqrt(1 - zeta.^2);
%     lambda = sum(ksi.*zeta);
    r = sum(P*diag(ksi),2);
    s = sqrt(r'*r);
    r = r./s;
end
