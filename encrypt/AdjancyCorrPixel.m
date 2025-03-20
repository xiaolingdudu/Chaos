function r_xy=AdjancyCorrPixel( P, delta )
%**************************************%
% 参数P：输入图像灰度值
% 参数delta：选择计算某个方向的像素相关性系数和分布
%  1：水平方向；2：垂直方向；3：对角方向
%**************************************%
if delta == 1
    %水平方向相关性
    x1 = double(P(:,1:end-1));
    y1 = double(P(:,2:end));
elseif delta == 2
    %垂直方向相关性
    x1 = double(P(1:end-1,:));
    y1 = double(P(2:end,:));
else
    %对角方向相关性
    x1 = double(P(1:end-1,1:end-1));
    y1 = double(P(2:end,2:end)); 
    
    
end
randIndex1 = randperm(numel(x1)); %随机抽取需要点的地址
randIndex1 = randIndex1(1:3000);  %取3000个点
x = x1(randIndex1);
y = y1(randIndex1);
r_xy = corrcoef(x,y); %计算相关性系数
scatter(x,y,'.');
if delta == 1
    %水平方向相关性
    xlabel('\it\fontname{Times New Roman}Pixel value on (x,y)'),ylabel('\it\fontname{Times New Roman}Pixel value on (x+1,y)');
    set(gca,'FontSize',12);
    set(get(gca,'XLabel'),'FontSize',14);
    set(get(gca,'YLabel'),'FontSize',14);
hold on
elseif delta == 2
    %垂直方向相关性
    xlabel('\it\fontname{Times New Roman}Pixel value on (x,y)'),ylabel('\it\fontname{Times New Roman}Pixel value on (x,y+1)');
    set(gca,'FontSize',12);
    set(get(gca,'XLabel'),'FontSize',14);
    set(get(gca,'YLabel'),'FontSize',14);
else
    %对角方向相关性
    xlabel('\it\fontname{Times New Roman}Pixel value on (x,y)'),ylabel('\it\fontname{Times New Roman}Pixel value on (x+1,y+1)');
    set(gca,'FontSize',12);
    set(get(gca,'XLabel'),'FontSize',14);
    set(get(gca,'YLabel'),'FontSize',14);
end
end