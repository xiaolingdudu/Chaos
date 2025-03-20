clear all; clc; close all;

% 加载并显示原始灰度图像
P = imread('aerial.png');  % 确保lena.jpg是灰度图像，否则需要转换
figure(1);
imshow(P);

% 加密过程
figure(2);
C1 = Encryption_and_Decryption2(P, 1, [0.1 0.1 0]);  
imshow(C1);
imwrite(C1, 'lena_encrypted_image_1.bmp');

% 改变密钥，加密图像，用于秘钥敏感性分析
C2 = Encryption_and_Decryption2(P, 1, [1 0.1 0]);  
figure(3);
imshow(C2);
imwrite(C2, 'lena_encrypted_image_2.bmp');

% 改变图像中的一个像素，然后加密，用于秘钥敏感性分析
P2 = P;
P2(66,33) = 255; % 对于灰度图像，直接改变像素值
figure(4);
C3 = Encryption_and_Decryption2(P2, 1, [1 0.1 0]);  
imshow(C3);

% 解密过程
D = Encryption_and_Decryption2(C1, 2, [0.1 0.1 0]);
figure(5);
imshow(D);
imwrite(D, 'lena_decrypted_image.bmp');

% 计算NPCR和UACI值
npcr = NPCR_and_UACI(C1, C2);  % 两个加密图像的比较
uaci = NPCR_and_UACI(C1, C3);  % 原始图像和改变了一个像素后加密图像的比较


