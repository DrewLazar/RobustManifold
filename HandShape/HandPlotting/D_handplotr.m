function D_handplotr(s)
x=real(s); y=-imag(s); 
% x(73)=x(1); y(73)=y(1); 
ptx=[x(1);x(72)]; 
pty=[y(1);y(72)];
t = [0;cumsum(diff(x).^2 + diff(y).^2)];
ti = linspace(0,t(end),5000);
xi = spline(t,x,ti);
yi = spline(t,y,ti);
plot(xi,yi,'r-'); hold on; 
scatter(x,y,20,'filled','r');
% plot(ptx,pty,'r-'); 
end
