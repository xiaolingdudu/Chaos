clear all;clc;
close all;
P=imread('lena.jpg'); %加载原始图片
figure(1);
% subplot(1,2,1);
imshow(uint8(P));
% title('Original Image');

%加密进程
figure(2);
C1=Encryption_and_Decryption(P,100,[0.1 0.1 0]);  
% subplot(1,2,2);
imshow(uint8(C1));
% title('Encrypted Image');
imwrite(uint8(C1),'lena_encrypted_image_1.bmp');

% figure(3);
% C2=Encryption_and_Decryption(P,1,[1 0.1 0]);  %改变混沌系统初始值，用于分析秘钥敏感性
% imshow(uint8(C2));
% % title('lena encrypted image');
% imwrite(uint8(C2),'lena_encrypted_image_2.bmp');
% 
% P2 = P;
% P2(66,33,1)=255; %改变任意原始图像中的像素点
% figure(3);
% imshow(uint8(P2));
% C3=Encryption_and_Decryption(P2,1,[1 0.1 0]);  %改变混沌系统初始值，用于分析秘钥敏感性
% imshow(uint8(C3));
% 
% figure(44);
% C4=Encryption_and_Decryption(P,1,[0.1 1 0]);  %改变混沌系统初始值，用于分析秘钥敏感性
% imshow(uint8(C4));
% % title('lena encrypted image');
% imwrite(uint8(C4),'lena_encrypted_image_2.bmp');
% 
% figure(45);
% C5=Encryption_and_Decryption(P,1,[0.1 0.1 0.1]);  %改变混沌系统初始值，用于分析秘钥敏感性
% imshow(uint8(C5));
% % title('lena encrypted image');
% imwrite(uint8(C5),'lena_encrypted_image_2.bmp');

%解密进程
% P=imread('lena_encrypted_image_1.bmp'); %加载图片
% figure(401);
% D=Encryption_and_Decryption(C1,2,[0.1 0.1 0.1]);
% % subplot(1,3,3);
% imshow(uint8(D));
% % title('Decrypted Image');
% imwrite(uint8(D),'lena_decrypted_image.bmp'); 


%%
%********加密算法性能分析********
%*****************************************************************
% % 直方图分析
% figure(5)
% %R通道
% imhist(uint8(P(:,:,1)));
% figure(6)
% imhist(uint8(C1(:,:,1)));
% %G通道
% figure(7)
% imhist(uint8(P(:,:,2)));
% figure(8)
% imhist(uint8(C1(:,:,2)));
% %B通道
% figure(9)
% imhist(uint8(P(:,:,3)));
% figure(10)
% imhist(uint8(C1(:,:,3)));
% Load the original and encrypted images
% P = imread('lena.jpg'); % Replace with your original image path
% C1 = imread('lena_encrypted_image_1.bmp'); % Replace with your encrypted image path
% 
% % Create a new figure
% figure;
% 
% % Plot the Red channel histogram of the original image
% imhist(P(:,:,1), 256);
% hold on; % Keep the current histogram
% imhist(P(:,:,2), 256);
% imhist(P(:,:,3), 256);
% title('Original Image - RGB Channels');
% legend('Red Channel', 'Green Channel', 'Blue Channel');
% hold off; % Release the current figure
% figure;
% % Plot the Red channel histogram of the encrypted image
% imhist(C1(:,:,1), 256);
% hold on; % Keep the current histogram
% imhist(C1(:,:,2), 256);
% imhist(C1(:,:,3), 256);
% title('Encrypted Image - RGB Channels');
% legend('Red Channel', 'Green Channel', 'Blue Channel');
% hold off; % Release the current figure


P = imread('lena.jpg'); % Replace with your original image path
C1 = imread('lena_encrypted_image_1.bmp'); % Replace with your encrypted image path

%  http://blog.csdn.net/yimingsilence/article/details/40542173
%  matlab里颜色直方图的画法

figure;
%1.三个颜色的直方图画在一起。
I=imread('lena.jpg');   % 文件名自己改
siz=size(I);
I1=reshape(I,siz(1)*siz(2),siz(3));  % 每个颜色通道变为一列
I1=double(I1);
[N,X]=hist(I1, [0:1:255]);    % 如果需要小矩形宽一点，划分区域少点，可以把步长改大，比如0:5:255
bar(X,N(:,[3 2 1]));    % 柱形图，用N(:,[3 2 1])是因为默认绘图的时候采用的颜色顺序为b,g,r,c,m,y,k，跟图片的rgb顺序正好相反，所以把图片列的顺序倒过来，让图片颜色通道跟绘制时的颜色一致
xlim([0 255]);
hold on;
% plot(X,N(:,[6,5,4]));    % 上边界轮廓
hold off;

% %2.分开画
% i=imread('lena.jpg'); %读取你要看的图像
% R=i(:,:,1); %把RGB各个分量提出
% G=i(:,:,2);
% B=i(:,:,3);
% figure; %画出直方图
% subplot(1,3,1); imhist(R); title('红色');
% subplot(1,3,2); imhist(G); title('绿色');
% subplot(1,3,3); imhist(B); title('蓝色');

% %% 相关性计算
% %随机抽取3000组相邻像素值,计算水平方向相邻像素的相关性分布
% figure(11)
% PR_CH=AdjancyCorrPixel(P(:,:,1),1);  %R通道
% figure(12)
% CR_CH=AdjancyCorrPixel(C1(:,:,1),1);
% figure(13)
% PG_CH=AdjancyCorrPixel(P(:,:,2),1);  %G通道
% figure(14)
% CG_CH=AdjancyCorrPixel(C1(:,:,2),1);
% figure(15)
% PB_CH=AdjancyCorrPixel(P(:,:,3),1);  %B通道
% figure(16)
% CB_CH=AdjancyCorrPixel(C1(:,:,3),1);
% %随机抽取3000组相邻像素值,计算垂直方向相邻像素的相关性分布
% figure(17)
% PR_CV=AdjancyCorrPixel(P(:,:,1),2);  %R通道
% figure(18)
% CR_CV=AdjancyCorrPixel(C1(:,:,1),2);
% figure(19)
% PG_CV=AdjancyCorrPixel(P(:,:,2),2);  %G通道
% figure(20)
% CG_CV=AdjancyCorrPixel(C1(:,:,2),2);
% figure(21)
% PB_CV=AdjancyCorrPixel(P(:,:,3),2);  %B通道
% figure(22)
% CB_CV=AdjancyCorrPixel(C1(:,:,3),2);
% %随机抽取3000组相邻像素值,计算对角方向相邻像素的相关性分布
% figure(23)
% PR_CD=AdjancyCorrPixel(P(:,:,1),3);  %R通道
% figure(24)
% CR_CD=AdjancyCorrPixel(C1(:,:,1),3);
% figure(25)
% PG_CD=AdjancyCorrPixel(P(:,:,2),3);  %G通道
% figure(26)
% CG_CD=AdjancyCorrPixel(C1(:,:,2),3);
% figure(27)
% PB_CD=AdjancyCorrPixel(P(:,:,3),3);  %B通道
% figure(28)
% CB_CD=AdjancyCorrPixel(C1(:,:,3),3);

% %% 计算像素变化率(NPCR)和归一平均变化强度(UACI)
% %秘钥敏感性分析 x扰动
% x_results_r = NPCR_and_UACI(C1(:,:,1),C2(:,:,1),1,255);
% x_results_g = NPCR_and_UACI(C1(:,:,2),C2(:,:,2),1,255);
% x_results_b = NPCR_and_UACI(C1(:,:,3),C2(:,:,3),1,255);
% 
% y_results_r = NPCR_and_UACI(C1(:,:,1),C4(:,:,1),1,255);
% y_results_g = NPCR_and_UACI(C1(:,:,2),C4(:,:,2),1,255);
% y_results_b = NPCR_and_UACI(C1(:,:,3),C4(:,:,3),1,255);
% 
% z_results_r = NPCR_and_UACI(C1(:,:,1),C5(:,:,1),1,255);
% z_results_g = NPCR_and_UACI(C1(:,:,2),C5(:,:,2),1,255);
% z_results_b = NPCR_and_UACI(C1(:,:,3),C5(:,:,3),1,255);
% 
% results_r = NPCR_and_UACI(C2(:,:,1),C3(:,:,1),1,255);
% results_g = NPCR_and_UACI(C2(:,:,2),C3(:,:,2),1,255);
% results_b = NPCR_and_UACI(C2(:,:,3),C3(:,:,3),1,255);
%% 香农信息熵计算
%原始图像
Hx_Pr = Entropy(P,1);
Hx_Pg = Entropy(P,2);
Hx_Pb = Entropy(P,3);
%加密图像
Hx_Cr = Entropy(C1,1);
Hx_Cg = Entropy(C1,2);
Hx_Cb = Entropy(C1,3);

% %% 加密图像随机性分析
% %图像随机性分析使用NIST-test-suite套件
% %产生二进制序列
% fid=fopen('D:\Users\HUI\Desktop\paper\多涡卷共存系统\图像加密\sts\sts-2.1.2\data\outdata.txt','w+');%输出
%     Cdata = C1(:,:,1);  %二维像素矩阵
%     cd = Cdata(:); %二维像素矩阵转化为一维像素矩阵
%     fprintf(fid,'%s\n',dec2bin(cd)); %写入txt文件
% fclose('all');

% % 噪声检测

% % 加密过程后，将加密图像存储为变量
% encryptedImage = C1; 
% 
% % 为加密图像添加10%椒盐噪声
% noisyImage_salt_pepper = imnoise(encryptedImage, 'salt & pepper', 0.1);
% imwrite(noisyImage_salt_pepper, 'lena_encrypted_image_salt_pepper.bmp');
% 
% % 对带有10%椒盐噪声的图像进行解密
% decryptedImage_salt_pepper = Encryption_and_Decryption(noisyImage_salt_pepper, 2, [0.1 0.1 0]);
% figure;
% imshow(decryptedImage_salt_pepper);
% title('Decrypted Image with Salt and Pepper Noise');
% 
% % 模拟数据丢失：将加密图像的6%像素随机设置为黑色或白色
% data_loss_rate = 0.06; % 数据丢失率
% noisyImage_data_loss = encryptedImage;
% numOfPixels = numel(encryptedImage);
% numOfPixelsToCorrupt = round(numOfPixels * data_loss_rate); % 6%的像素数量
% corruptedPixels = randperm(numOfPixels, numOfPixelsToCorrupt);
% noisyImage_data_loss(corruptedPixels) = randi([0, 255], size(corruptedPixels), 'like', encryptedImage);
% imwrite(noisyImage_data_loss, 'lena_encrypted_image_data_loss.bmp');
% 
% % 对模拟数据丢失后的图像进行解密
% decryptedImage_data_loss = Encryption_and_Decryption(noisyImage_data_loss, 2, [0.1 0.1 0]);
% figure;
% imshow(decryptedImage_data_loss);
% title('Decrypted Image with Data Loss');

% % 噪声
% % 读取原始图像
% P = imread('lena.jpg');
% 
% % 通过我们提出的算法对图像进行加密
% C = Encryption_and_Decryption(P, 1, [0.1 0.1 0]);
% 
% % 保存加密图像
% imwrite(C, 'lena_encrypted.bmp');
% 
% % 使用大小为70x70的黑色方块模拟数据丢失攻击
% data_loss_image = C;
% block_size = 50;  % 方块大小
% center = floor(size(data_loss_image) / 2);  % 图像中心
% data_loss_image(center(1)-block_size:center(1)+block_size, center(2)-block_size:center(2)+block_size, :) = 0;
% imwrite(data_loss_image, 'lena_data_loss.bmp');
% 
% % 添加10%的椒盐噪声模拟噪声攻击
% noisy_image = imnoise(C, 'salt & pepper', 0.1);
% imwrite(noisy_image, 'lena_noisy.bmp');
% 
% % 将解密过程应用于数据丢失的图像
% D_data_loss = Encryption_and_Decryption(data_loss_image, 2, [0.1 0.1 0]);
% imwrite(D_data_loss, 'lena_decrypted_data_loss.bmp');
% 
% % 将解密过程应用于带噪声的图像
% D_noisy = Encryption_and_Decryption(noisy_image, 2, [0.1 0.1 0]);
% imwrite(D_noisy, 'lena_decrypted_noisy.bmp');
% 
% % 显示并保存结果
% figure;
% figure;imshow(C); 
% figure; imshow(data_loss_image);
%  figure;imshow(noisy_image);
% figure;imshow(D_data_loss); 
%  figure;imshow(D_noisy); 
% 
% % %  PSNR和SSIM
% % 加载原始图像
% P = imread('lena.jpg'); 
% imshow(uint8(P));
% title('Original Image');
% 
% % 对原始图像进行加密
% C1 = Encryption_and_Decryption(P, 1, [0.1 0.1 0]);
% imshow(uint8(C1));
% title('Encrypted Image');
% imwrite(uint8(C1), 'lena_encrypted_image_1.bmp');
% 
% % 添加椒盐噪声
% noisyEncryptedImage = imnoise(C1, 'salt & pepper', 0.01);
% imshow(uint8(noisyEncryptedImage));
% title('Noisy Encrypted Image');
% imwrite(uint8(noisyEncryptedImage), 'lena_encrypted_image_noisy.bmp');
% 
% % 解密加密且带噪声的图像
% D_noisy = Encryption_and_Decryption(noisyEncryptedImage, 2, [0.1 0.1 0.1]);
% imshow(uint8(D_noisy));
% title('Decrypted Image from Noisy Encrypted Image');
% imwrite(uint8(D_noisy), 'lena_decrypted_image_from_noisy.bmp');
% 
% % 计算PSNR和SSIM
% originalImage = double(P) / 255; % 归一化原始图像
% restoredImage = double(D_noisy) / 255; % 归一化恢复图像
% 
% % PSNR
% psnrValue = psnr(restoredImage, originalImage);
% 
% % SSIM
% [ssimValue, ~] = ssim(restoredImage, originalImage);
% 
% % 显示计算结果
% fprintf('The PSNR value is: %0.4f dB\n', psnrValue);
% fprintf('The SSIM value is: %0.4f\n', ssimValue);
% 
