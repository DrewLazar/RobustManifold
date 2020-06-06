function y = Mat_log(p,w)
% MATRIX_LOG - Mat_log(p,w)
%The Riemannian logarithm of a positive definite matrix, w
% at a positive definite matrix, p. 
    g = chol(p)';
    Z = (g\w)/g';
    y = g*logm(Z)*g';
    
   
    