function [ ] = SpherePlot(D,dcol)
%Plot sphere
n=length(D);
axis([-1 1 -1 1 -1 1]);
hold on;
[x,y,z]=sphere(30);
surf(x,y,z);
colormap gray
alpha(.2);
plot3(0,0,0,'marker','.','markersize',20,'color','k');
% Generate and plot data
for j=1:n
     plot3(D(j,1),D(j,2),D(j,3),'marker','.','markersize',20,'color',dcol);
end
hold off;
end

