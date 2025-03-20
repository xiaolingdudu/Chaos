function NBCR = calculate_NBCR(image1, image2)
    % 确保输入图像是灰度图或者单通道图像
    if size(image1, 3) == 3
        image1 = rgb2gray(image1);
    end
    if size(image2, 3) == 3
        image2 = rgb2gray(image2);
    end

    % 转换图像为二进制串
    binImage1 = dec2bin(image1(:));
    binImage2 = dec2bin(image2(:));

    % 计算汉明距离：两个二进制串不同比特的数目
    hammingDistance = sum(binImage1 ~= binImage2, 'all');

    % 计算总比特数
    totalBits = numel(binImage1) * size(binImage1, 2);

    % 计算NBCR
    NBCR = (hammingDistance / totalBits) * 100;
end
