function d = geo_dis(x,w)
% Geo_dis - geo_dis(x,w)    
% Returns the geodesic distance between two points (x and w) 
% in the space of positive definite matrices.

g = chol(x)';
    logpq = logm(g\w/g');
    d = sqrt(trace(logpq^2));
    