function D = DExp(W,V)
% Computes the directional derivative of the matrix exponential at W in the
% direction of V when W is diagonalizable. Note this assumes W's
% eigenvalues are unique. 

n=size(W,1);
%Computation of eigenvalues and eigenvectors of W
    [U,L]=eig(full(W));
%Computation of Phi matrix in [1,Theorem 4.5]
    OM = ones(n);
    X = expm(L);
    Y = X + X*OM - OM*X;
    Z = 1./(eye(n)+L*OM-OM*L);
    Phi = Y.*Z; %Hadamard Product
%Computation of Directional Derivative
    VB=U'*V*U;
    C= VB.*Phi;
    D = U*C*U'; %Hadamard Product
end







 




