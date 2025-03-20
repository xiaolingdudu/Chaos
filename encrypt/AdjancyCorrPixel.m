function r_xy=AdjancyCorrPixel( P, delta )
%**************************************%
% ����P������ͼ��Ҷ�ֵ
% ����delta��ѡ�����ĳ����������������ϵ���ͷֲ�
%  1��ˮƽ����2����ֱ����3���ԽǷ���
%**************************************%
if delta == 1
    %ˮƽ���������
    x1 = double(P(:,1:end-1));
    y1 = double(P(:,2:end));
elseif delta == 2
    %��ֱ���������
    x1 = double(P(1:end-1,:));
    y1 = double(P(2:end,:));
else
    %�ԽǷ��������
    x1 = double(P(1:end-1,1:end-1));
    y1 = double(P(2:end,2:end)); 
    
    
end
randIndex1 = randperm(numel(x1)); %�����ȡ��Ҫ��ĵ�ַ
randIndex1 = randIndex1(1:3000);  %ȡ3000����
x = x1(randIndex1);
y = y1(randIndex1);
r_xy = corrcoef(x,y); %���������ϵ��
scatter(x,y,'.');
if delta == 1
    %ˮƽ���������
    xlabel('\it\fontname{Times New Roman}Pixel value on (x,y)'),ylabel('\it\fontname{Times New Roman}Pixel value on (x+1,y)');
    set(gca,'FontSize',12);
    set(get(gca,'XLabel'),'FontSize',14);
    set(get(gca,'YLabel'),'FontSize',14);
hold on
elseif delta == 2
    %��ֱ���������
    xlabel('\it\fontname{Times New Roman}Pixel value on (x,y)'),ylabel('\it\fontname{Times New Roman}Pixel value on (x,y+1)');
    set(gca,'FontSize',12);
    set(get(gca,'XLabel'),'FontSize',14);
    set(get(gca,'YLabel'),'FontSize',14);
else
    %�ԽǷ��������
    xlabel('\it\fontname{Times New Roman}Pixel value on (x,y)'),ylabel('\it\fontname{Times New Roman}Pixel value on (x+1,y+1)');
    set(gca,'FontSize',12);
    set(get(gca,'XLabel'),'FontSize',14);
    set(get(gca,'YLabel'),'FontSize',14);
end
end