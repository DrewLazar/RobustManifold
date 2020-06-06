load('HandsCS.mat'); 
DO=D_handoutlier(3); 
%Computing mean with outliers
DWO3 = D_int_mean_damp([DH DO(:,1:3)]);
%Computing mean without outliers 
DNO = D_int_mean_damp(DH);
%Computing means by divide and conquer
%3 outliers
b1 = D_int_mean_damp([DH(:,1) DH(:,3) DH(:,7)]);
b2 = D_int_mean_damp([DH(:,2) DH(:,10) DH(:,11)]);
b3 = D_int_mean_damp([DH(:,4) DH(:,8) DH(:,12)]);
b4 = D_int_mean_damp([DH(:,5) DH(:,9) DH(:,16)]);
b5 = D_int_mean_damp([DH(:,6) DO(:,1)  DO(:,2)]);
b6 = D_int_mean_damp([DH(:,15) DH(:,18) DH(:,17)]);
b7 = D_int_mean_damp([DO(:,3) DH(:,13)  DH(:,14)]); 
b10 = D_int_medianf([b1 b2 b3 b4 b5 b6 b7]); 
%Plot Data with three outliers
DA = [DH(:,1) DO(:,1) DH(:,2:9) DO(:,2) DH(:,10:16) DO(:,3) DH(:,17:18)]; 
for I=1:5
    DAP(:,I)=DA(:,I)+.4*I+sqrt(-1)*.75;
    DAP(:,I+5)=DA(:,I+5)+.4*I+sqrt(-1)*.25;
    DAP(:,I+10)=DA(:,I+10)+.4*I-sqrt(-1)*.25;
    DAP(:,I+15)=DA(:,I+15)+.35*I-sqrt(-1)*.75;
end
DAP(:,21)=DA(:,21)+2.1-sqrt(-1)*.75;
for I=1:21
  D_handplotb(DAP(:,I));
   axis equal; 
end
 axis off; 
 pause; 
%Group and plot data with three outliers 
for I=[1 4 8]
    D_handplotm(DAP(:,I));
end
for I=[3 12 13]
    D_handplotr(DAP(:,I));
end
for I=[5 9 14]
    D_handplotc(DAP(:,I));
end
for I=[6 10 18]
    D_handploty(DAP(:,I));
end
for I=[7 2 11]
    D_handplotp(DAP(:,I));
end
for I=[17 21 20]
    D_handplotg(DAP(:,I));
end
for I=[19 15 16]
    D_handplotb2(DAP(:,I));
end
   axis equal; 
 set(gca, 'XTick', []);  set(gca, 'YTick', []); 
 pause; 
 hold off; 
 %Plot means of each group
    DAM = [b1-.3 b2 b3+.3 b4+.6 b5-.15+.43*sqrt(-1) b6+.15+.43*sqrt(-1) b7+.45+.43*sqrt(-1)];
        D_handplotm(DAM(:,1));
        D_handplotr(DAM(:,2));
         D_handplotc(DAM(:,3));
        D_handploty(DAM(:,4));
        D_handplotp(DAM(:,5));
         D_handplotg(DAM(:,6));
          D_handplotb2(DAM(:,7));
        axis equal; 
         set(gca, 'XTick', []);  set(gca, 'YTick', []); 
    pause; 
    
          %Plot overall mean and geometric median 
 D_handplotb(DWO3 -.32); 
 D_handplotb(b10); 
 axis equal; 
 axis off; 