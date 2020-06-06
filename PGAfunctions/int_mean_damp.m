function u = int_mean_damp(P)
% Intrinsic Mean - intmean(P)
% Gradient Damping Algorithm from Riemannian Geometry for the Statistical
% Analysis of Diffusion Tensor Data by Fletcher and Joshi 
% Finds the instrinsic mean of the positive definite matrices arrayed in 
% P using the gradient damping algorithm.

[~,~,N] = size(P);
n = length(P(:,:,1));

%t is the gradient damping factor
    t = 1;
%An initial guess
    u = eye(n);
%Calculating the initial gradient (X) and it's size (zx) 
    Q = zeros(n,n,N);
    for i=1:N
        Q(:,:,i) = Mat_log(u,P(:,:,i));
    end
    X = (1/N)*sum(Q,3); 
    zx = Riemann_met(u,X,X);
%Saving initial gradient and size for comparison
    Y = X; zy = zx; ou =u;
%Updating the initial guess
    u = Mat_exp(u,t*X);
%Loop to update guess until size of gradient meets tolerance
    while zx > 1e-15
    %Calculating the gradient (X) and its size (zx)    
         Q = zeros(n,n,N);
         for i=1:N
            Q(:,:,i) = Mat_log(u,P(:,:,i));
         end;
         X = (1/N)*sum(Q,3); 
         zx = Riemann_met(u,X,X);     
    %Comparing size of new gradient to old and halving damping factor if larger
    %otherwise saving gradient and size and updating guess
    if zx > zy;
        t = t/2; X = Y; u = Mat_exp(ou,t*X);
    else ou =u;
        u = Mat_exp(u,t*X);
        Y = X; zy = zx;
    end;
    end;
end

