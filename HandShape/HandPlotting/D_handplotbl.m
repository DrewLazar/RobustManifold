function D_handplotbl(s)
k=size(s);
for J=1:k
      hold on; 
    scatter(real(s(J)),-imag(s(J)),'filled','k');
end;
end

