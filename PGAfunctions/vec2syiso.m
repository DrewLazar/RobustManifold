function A = vec2syiso(V)
% Vector to symmetric matrix - vec2symmat(V)
% Converts vector "V" with (n^2+n)/2 entries to an n-by-n symmetric 
% matrix "A" in the canonical basis. 

[~,b] = size(V);
if b == 1
    V=V'; end;
n = length(V);
N = (-1 + sqrt(1 + 8*n))/2;
A = zeros(N);
I = [0 cumsum(1:N)];
for m = 1:N
    a=V(I(m)+1:I(m + 1));
    s=length(a);
    b = (1/sqrt(2))*a(1:s-1);
    a = [b a(s)];
A(1:m, m) = a;
end
% Insert symmetric part
for m = 1:N-1
A(m+1:N, m) = A(m, m+1:N).';
end