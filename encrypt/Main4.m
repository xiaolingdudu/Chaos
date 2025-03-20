clear all; clc; close all;

% 加载并显示原始灰度图像
P = imread('circuit.jpg'); 
figure(1);
imshow(P);

% 加密过程
C1 = Encryption_and_Decryption3(P, 1000, [0.1 0.1 0]);  
figure(2);
imshow(C1);
imwrite(C1, 'lena_encrypted_gray_1.bmp');

% 随机抽取3000组相邻像素值，计算水平方向相邻像素的相关性分布
figure(3);
PR_CH = AdjancyCorrPixel(P, 1);  % 对于灰度图像只需传入P
figure(4);
CR_CH = AdjancyCorrPixel(C1, 1); % 对于灰度图像只需传入C1

% 随机抽取3000组相邻像素值，计算垂直方向相邻像素的相关性分布
figure(5);
PR_CV = AdjancyCorrPixel(P, 2);
figure(6);
CR_CV = AdjancyCorrPixel(C1, 2);

% 随机抽取3000组相邻像素值，计算对角方向相邻像素的相关性分布
figure(7);
PR_CD = AdjancyCorrPixel(P, 3);
figure(8);
CR_CD = AdjancyCorrPixel(C1, 3);
