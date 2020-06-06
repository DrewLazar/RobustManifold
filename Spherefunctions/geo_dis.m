function d = geo_dis(x,w)
% Geo_dis - geo_dis(x,w)    
% Returns the geodesic distance between two points, x and w, represented as  
% row vectors, on the unit sphere. 
d = acos(x*w'); 
end

    