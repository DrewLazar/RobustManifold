function u = D_int_mean_damp(P)
% Intrinsic Mean - intmean(P)
% Gradient Damping Algorithm from Riemannian Geometry for the Statistical
% Analysis of Diffusion Tensor Data by Fletcher and Joshi 
% Finds the instrinsic mean of the positive definite matrices arrayed in 
% P using the gradient damping algorithm.

[k,N] = size(P);

%t is the gradient damping factor
    t = 1;
%An initial guess
%     u= D_ext_mean(P);
    u = [1;zeros(k-1,1)]; 
%  u=D_int_mean(P); 
%Calculating the initial gradient (X) and it's size (zx) 
    Q = zeros(k,N);
    for j=1:N
        Q(:,j) = D_Sph_Log(u,P(:,j));
    end
    
    X = (1/N)*sum(Q,2); 
    zx = norm(X);
%Saving initial gradient and size for comparison
    Y = X; zy = zx; ou =u;
%Updating the initial guess
    u = D_Sph_Exp(u,t*X);
%Loop to update guess until size of gradient meets tolerance
    while zx > 1e-14
    %Calculating the gradient (X) and its size (zx)    
       Q = zeros(k,N);
    for j=1:N
        Q(:,j) = D_Sph_Log(u,P(:,j));
    end
    X = (1/N)*sum(Q,2);
         zx = norm(X);    
    %Comparing size of new gradient to old and halving damping factor if larger
    %otherwise saving gradient and size and updating guess
    if zx > zy
        t = t/2; X = Y; u = D_Sph_Exp(ou,t*X);
    else ou =u;
        u = D_Sph_Exp(u,t*X);
        Y = X; zy = zx;
    end
    end
end
% sum((acos(abs(c1'*u1))).^2)
