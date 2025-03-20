clear all; clc; close all;

% 加载原始灰度图片
P = imread('aerial.png'); % 'cameraman.jpg' 是一个标准的灰度图像
figure(1);
imshow(P); % 显示原始图像

% 加密进程
figure(2);
C1 = Encryption_and_Decryption2(P, 1, [0.1 0.1 0]);  
imshow(uint8(C1)); % 显示加密图像
imwrite(uint8(C1), 'cameraman_encrypted_image_1.bmp'); % 保存加密图像

% 解密进程
figure(3);
D = Encryption_and_Decryption2(C1, 2, [0.1 0.1 0]); % 使用相同的初始条件解密
imshow(uint8(D)); % 显示解密图像
imwrite(uint8(D), 'cameraman_decrypted_image.bmp'); % 保存解密图像

% 直方图分析
figure(4);
subplot(1, 2, 1);
imhist(P); % 显示原始图像的直方图
title('Original Image Histogram');

subplot(1, 2, 2);
imhist(uint8(C1)); % 显示加密图像的直方图
title('Encrypted Image Histogram');

h = figure;
imhist(uint8(P)); % 假设P是您的图像数据
% 使用print函数保存整个图形窗口
print(h, 'my_histogram.png', '-dpng');
% 或者使用saveas函数保存
saveas(h, 'my_histogram.png');
