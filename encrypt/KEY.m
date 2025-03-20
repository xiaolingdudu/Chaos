clear all;clc;
close all;
P=imread('kuku.png'); %加载原始图片
figure(1);
% subplot(1,2,1);
imshow(uint8(P));
% title('Original Image');

%加密进程
figure(2);
C1=Encryption_and_Decryption(P,1,[0.1 0.1 0]);  
% subplot(1,2,2);
imshow(uint8(C1));
% title('Encrypted Image');
imwrite(uint8(C1),'lena_encrypted_image_1.bmp');

% figure(3);
% C2=Encryption_and_Decryption(P,1,[1 0.1 0]);  %改变混沌系统初始值，用于分析秘钥敏感性
% imshow(uint8(C2));
% % title('lena encrypted image');
% imwrite(uint8(C2),'lena_encrypted_image_2.bmp');

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
P=imread('lena_encrypted_image_1.bmp'); %加载图片
figure(401);
D=Encryption_and_Decryption(C1,2,[0.1 0.1 0.1]);
% subplot(1,3,3);
imshow(uint8(D));
% title('Decrypted Image');
imwrite(uint8(D),'lena_decrypted_image.bmp'); 
