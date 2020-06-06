function t = Mat_exp(p,X)
% MATRIX_EXP - Mat_exp(p,X) 
% Calculates the matrix exponential of a tangent vector (a symmetric
% matrix) X at a positive definite matrix, p. 
    g = chol(p)';
     Y = g\X/g';
    t = g*expm(Y)*g';
    
    




             