load('MAT_hands.mat','H')
  n = 18; k = 72; DH = zeros(k,n); 
    for J = 1:n
        for I = 1:k
          DH(I,J) = H(I,1,J) + sqrt(-1)*H(I,2,J);
        end
        DH(:,J) = DH(:,J) - sum(DH(:,J))/k;    %centering the colmns.
        DH(:,J) = DH(:,J)/ sqrt(DH(:,J)'*DH(:,J));     % normalizing the columns
    end
save('Hands_CN.mat','DH')