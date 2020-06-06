function CB = orth_comp_basis(B)
%Orthogonal complement basis - orth_comp_basis(B)
%Returns a basis for the orthogonal complement of
%the span of the tangent vectors in B. 

[~,~,dspanB]=size(B);
n=length(B(:,:,1));
dtan = n*(n+1)/2;
dcomp= dtan - dspanB;

A = zeros(dspanB,dtan);
for i = 1:dspanB;
    A(i,:)=vecfsyiso(B(:,:,i));
end;
D=null(A);
CB = zeros(n,n,dcomp);
for j= 1:dcomp;
    CB(:,:,j)=vec2syiso(D(:,j));
end;
end
    

