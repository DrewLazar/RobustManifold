function D_handplotp2(s)
A=s(1:58); 
D_handplotp(A); 
x=real(s(59:72)); y=-imag(s(59:72)); 
% x(73)=x(1); y(73)=y(1); 
% ptx=[x(1);x(72)]; 
% pty=[y(1);y(72)];
% t = [0;cumsum(diff(x).^2 + diff(y).^2)];
% ti = linspace(0,t(end),5000);
% xi = spline(t,x,ti);
% yi = spline(t,y,ti);
purp=[0.294118 0 0.509804]; 
plot(x,y,'Color',purp); hold on; 
scatter(x,y,20,[0.294118 0 0.509804],'filled');
% plot(ptx,pty,'Color',purp); 
end