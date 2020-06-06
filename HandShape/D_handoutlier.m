function out = D_handoutlier(n)
out=zeros(72,n); 
for J=1:n
    a = .5 + .5*rand; b=.5+.5*rand;
    for I = 0:71
    out(I+1,J) = a*cos(I*pi/36)+sqrt(-1)*b*sin(I*pi/36);
    end
end
    for J = 1:n
        out(:,J) = out(:,J) - sum(out(:,J))/72;    %centering the colmns.
        out(:,J) = out(:,J)/ sqrt(out(:,J)'*out(:,J));     % normalizing the columns
    end

    