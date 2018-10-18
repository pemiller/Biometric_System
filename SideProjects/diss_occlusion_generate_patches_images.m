
scores = [0.203,0.1634,0.1486,0.1931,0.1189,0.1288,0.1486,0.1783,0.1733,0.1733,0.1387,0.203,0.1634,0.1288,0.1832,0.1733,0.1634,0.1832,0.203,0.1832,0.1832,0.2278,0.203,0.1733,0.1436,0.1733,0.1535,0.1585,0.2228,0.203,0.2328,0.3169,0.1733,0.1634,0.1882,0.1733,0.2228,0.2228,0.2922,0.2823,0.1535,0.2427,0.1486,0.1981,0.1634,0.1684,0.1832,0.1585,0.2773,0.1931,0.1387,0.1634,0.1387,0.1832,0.1337,0.1486,0.1832,0.2129,0.1733,0.1981,0.1288,0.2228,0.2228,0.1981,0.1634,0.1486,0.1981,0.1882,0.2773,0.1436,0.1337,0.1238,0.2179,0.1931,0.1387,0.1486,0.2724,0.1931,0.2377,0.1634,0.1684,0.1535,0.2129,0.1535,0.1585,0.1733,0.1337,0.2129,0.1832,0.1585,0.2129,0.1981,0.2328,0.1733,0.1387,0.1882,0.2427,0.2773,0.2575,0.1634,0.1337,0.1634,0.2922,0.2228,0.1387,0.1783,0.2674,0.3764,0.2278,0.1486,0.1189,0.1931,0.2823,0.2278,0.1783,0.208,0.3021,0.2823,0.1684,0.1189];

map = zeros(250,200);
py = 20;
px = 20;

for i = 1:length(scores)
	ys = (floor((i-1)/10)*py)+1;
	xs = (mod(i-1,10)*px)+1;
	map(ys:ys+py,xs:xs+px) = scores(i);
end

% save results matrix
map2 = double(map) / double(max(max(map)));
map2 = uint8(round(map2 * 255.0));
imwrite(map2,['diss60000036_patches.ppm'],'ppm');

set(gcf, 'Visible', 'off')
h = imagesc(map);    
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',[]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
colorbar;
saveas(h,['diss60000036_heatmap.ppm'],'ppm');