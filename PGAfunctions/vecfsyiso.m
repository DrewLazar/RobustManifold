function y = vecfsyiso(Y)
%Symmetric matrix to vector - svect(Y)
%Converts a symmetric matrix into a vector. 

N=size(Y,1);

y = zeros(N*(N+1)/2,1);
count = 1;
for j=1:N
   for i=1:j
      if i~=j
         y(count) = sqrt(2)*Y(i,j);
      else
         y(count) = Y(i,j);
      end
      count = count + 1;
   end
end