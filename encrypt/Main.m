clear all;clc;
close all;
P=imread('lena.jpg'); %����ԭʼͼƬ
figure(1);
% subplot(1,2,1);
imshow(uint8(P));
% title('Original Image');

%���ܽ���
figure(2);
C1=Encryption_and_Decryption(P,100,[0.1 0.1 0]);  
% subplot(1,2,2);
imshow(uint8(C1));
% title('Encrypted Image');
imwrite(uint8(C1),'lena_encrypted_image_1.bmp');

% figure(3);
% C2=Encryption_and_Decryption(P,1,[1 0.1 0]);  %�ı����ϵͳ��ʼֵ�����ڷ�����Կ������
% imshow(uint8(C2));
% % title('lena encrypted image');
% imwrite(uint8(C2),'lena_encrypted_image_2.bmp');
% 
% P2 = P;
% P2(66,33,1)=255; %�ı�����ԭʼͼ���е����ص�
% figure(3);
% imshow(uint8(P2));
% C3=Encryption_and_Decryption(P2,1,[1 0.1 0]);  %�ı����ϵͳ��ʼֵ�����ڷ�����Կ������
% imshow(uint8(C3));
% 
% figure(44);
% C4=Encryption_and_Decryption(P,1,[0.1 1 0]);  %�ı����ϵͳ��ʼֵ�����ڷ�����Կ������
% imshow(uint8(C4));
% % title('lena encrypted image');
% imwrite(uint8(C4),'lena_encrypted_image_2.bmp');
% 
% figure(45);
% C5=Encryption_and_Decryption(P,1,[0.1 0.1 0.1]);  %�ı����ϵͳ��ʼֵ�����ڷ�����Կ������
% imshow(uint8(C5));
% % title('lena encrypted image');
% imwrite(uint8(C5),'lena_encrypted_image_2.bmp');

%���ܽ���
% P=imread('lena_encrypted_image_1.bmp'); %����ͼƬ
% figure(401);
% D=Encryption_and_Decryption(C1,2,[0.1 0.1 0.1]);
% % subplot(1,3,3);
% imshow(uint8(D));
% % title('Decrypted Image');
% imwrite(uint8(D),'lena_decrypted_image.bmp'); 


%%
%********�����㷨���ܷ���********
%*****************************************************************
% % ֱ��ͼ����
% figure(5)
% %Rͨ��
% imhist(uint8(P(:,:,1)));
% figure(6)
% imhist(uint8(C1(:,:,1)));
% %Gͨ��
% figure(7)
% imhist(uint8(P(:,:,2)));
% figure(8)
% imhist(uint8(C1(:,:,2)));
% %Bͨ��
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
%  matlab����ɫֱ��ͼ�Ļ���

figure;
%1.������ɫ��ֱ��ͼ����һ��
I=imread('lena.jpg');   % �ļ����Լ���
siz=size(I);
I1=reshape(I,siz(1)*siz(2),siz(3));  % ÿ����ɫͨ����Ϊһ��
I1=double(I1);
[N,X]=hist(I1, [0:1:255]);    % �����ҪС���ο�һ�㣬���������ٵ㣬���԰Ѳ����Ĵ󣬱���0:5:255
bar(X,N(:,[3 2 1]));    % ����ͼ����N(:,[3 2 1])����ΪĬ�ϻ�ͼ��ʱ����õ���ɫ˳��Ϊb,g,r,c,m,y,k����ͼƬ��rgb˳�������෴�����԰�ͼƬ�е�˳�򵹹�������ͼƬ��ɫͨ��������ʱ����ɫһ��
xlim([0 255]);
hold on;
% plot(X,N(:,[6,5,4]));    % �ϱ߽�����
hold off;

% %2.�ֿ���
% i=imread('lena.jpg'); %��ȡ��Ҫ����ͼ��
% R=i(:,:,1); %��RGB�����������
% G=i(:,:,2);
% B=i(:,:,3);
% figure; %����ֱ��ͼ
% subplot(1,3,1); imhist(R); title('��ɫ');
% subplot(1,3,2); imhist(G); title('��ɫ');
% subplot(1,3,3); imhist(B); title('��ɫ');

% %% ����Լ���
% %�����ȡ3000����������ֵ,����ˮƽ�����������ص�����Էֲ�
% figure(11)
% PR_CH=AdjancyCorrPixel(P(:,:,1),1);  %Rͨ��
% figure(12)
% CR_CH=AdjancyCorrPixel(C1(:,:,1),1);
% figure(13)
% PG_CH=AdjancyCorrPixel(P(:,:,2),1);  %Gͨ��
% figure(14)
% CG_CH=AdjancyCorrPixel(C1(:,:,2),1);
% figure(15)
% PB_CH=AdjancyCorrPixel(P(:,:,3),1);  %Bͨ��
% figure(16)
% CB_CH=AdjancyCorrPixel(C1(:,:,3),1);
% %�����ȡ3000����������ֵ,���㴹ֱ�����������ص�����Էֲ�
% figure(17)
% PR_CV=AdjancyCorrPixel(P(:,:,1),2);  %Rͨ��
% figure(18)
% CR_CV=AdjancyCorrPixel(C1(:,:,1),2);
% figure(19)
% PG_CV=AdjancyCorrPixel(P(:,:,2),2);  %Gͨ��
% figure(20)
% CG_CV=AdjancyCorrPixel(C1(:,:,2),2);
% figure(21)
% PB_CV=AdjancyCorrPixel(P(:,:,3),2);  %Bͨ��
% figure(22)
% CB_CV=AdjancyCorrPixel(C1(:,:,3),2);
% %�����ȡ3000����������ֵ,����ԽǷ����������ص�����Էֲ�
% figure(23)
% PR_CD=AdjancyCorrPixel(P(:,:,1),3);  %Rͨ��
% figure(24)
% CR_CD=AdjancyCorrPixel(C1(:,:,1),3);
% figure(25)
% PG_CD=AdjancyCorrPixel(P(:,:,2),3);  %Gͨ��
% figure(26)
% CG_CD=AdjancyCorrPixel(C1(:,:,2),3);
% figure(27)
% PB_CD=AdjancyCorrPixel(P(:,:,3),3);  %Bͨ��
% figure(28)
% CB_CD=AdjancyCorrPixel(C1(:,:,3),3);

% %% �������ر仯��(NPCR)�͹�һƽ���仯ǿ��(UACI)
% %��Կ�����Է��� x�Ŷ�
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
%% ��ũ��Ϣ�ؼ���
%ԭʼͼ��
Hx_Pr = Entropy(P,1);
Hx_Pg = Entropy(P,2);
Hx_Pb = Entropy(P,3);
%����ͼ��
Hx_Cr = Entropy(C1,1);
Hx_Cg = Entropy(C1,2);
Hx_Cb = Entropy(C1,3);

% %% ����ͼ������Է���
% %ͼ������Է���ʹ��NIST-test-suite�׼�
% %��������������
% fid=fopen('D:\Users\HUI\Desktop\paper\���о���ϵͳ\ͼ�����\sts\sts-2.1.2\data\outdata.txt','w+');%���
%     Cdata = C1(:,:,1);  %��ά���ؾ���
%     cd = Cdata(:); %��ά���ؾ���ת��Ϊһά���ؾ���
%     fprintf(fid,'%s\n',dec2bin(cd)); %д��txt�ļ�
% fclose('all');

% % �������

% % ���ܹ��̺󣬽�����ͼ��洢Ϊ����
% encryptedImage = C1; 
% 
% % Ϊ����ͼ�����10%��������
% noisyImage_salt_pepper = imnoise(encryptedImage, 'salt & pepper', 0.1);
% imwrite(noisyImage_salt_pepper, 'lena_encrypted_image_salt_pepper.bmp');
% 
% % �Դ���10%����������ͼ����н���
% decryptedImage_salt_pepper = Encryption_and_Decryption(noisyImage_salt_pepper, 2, [0.1 0.1 0]);
% figure;
% imshow(decryptedImage_salt_pepper);
% title('Decrypted Image with Salt and Pepper Noise');
% 
% % ģ�����ݶ�ʧ��������ͼ���6%�����������Ϊ��ɫ���ɫ
% data_loss_rate = 0.06; % ���ݶ�ʧ��
% noisyImage_data_loss = encryptedImage;
% numOfPixels = numel(encryptedImage);
% numOfPixelsToCorrupt = round(numOfPixels * data_loss_rate); % 6%����������
% corruptedPixels = randperm(numOfPixels, numOfPixelsToCorrupt);
% noisyImage_data_loss(corruptedPixels) = randi([0, 255], size(corruptedPixels), 'like', encryptedImage);
% imwrite(noisyImage_data_loss, 'lena_encrypted_image_data_loss.bmp');
% 
% % ��ģ�����ݶ�ʧ���ͼ����н���
% decryptedImage_data_loss = Encryption_and_Decryption(noisyImage_data_loss, 2, [0.1 0.1 0]);
% figure;
% imshow(decryptedImage_data_loss);
% title('Decrypted Image with Data Loss');

% % ����
% % ��ȡԭʼͼ��
% P = imread('lena.jpg');
% 
% % ͨ������������㷨��ͼ����м���
% C = Encryption_and_Decryption(P, 1, [0.1 0.1 0]);
% 
% % �������ͼ��
% imwrite(C, 'lena_encrypted.bmp');
% 
% % ʹ�ô�СΪ70x70�ĺ�ɫ����ģ�����ݶ�ʧ����
% data_loss_image = C;
% block_size = 50;  % �����С
% center = floor(size(data_loss_image) / 2);  % ͼ������
% data_loss_image(center(1)-block_size:center(1)+block_size, center(2)-block_size:center(2)+block_size, :) = 0;
% imwrite(data_loss_image, 'lena_data_loss.bmp');
% 
% % ���10%�Ľ�������ģ����������
% noisy_image = imnoise(C, 'salt & pepper', 0.1);
% imwrite(noisy_image, 'lena_noisy.bmp');
% 
% % �����ܹ���Ӧ�������ݶ�ʧ��ͼ��
% D_data_loss = Encryption_and_Decryption(data_loss_image, 2, [0.1 0.1 0]);
% imwrite(D_data_loss, 'lena_decrypted_data_loss.bmp');
% 
% % �����ܹ���Ӧ���ڴ�������ͼ��
% D_noisy = Encryption_and_Decryption(noisy_image, 2, [0.1 0.1 0]);
% imwrite(D_noisy, 'lena_decrypted_noisy.bmp');
% 
% % ��ʾ��������
% figure;
% figure;imshow(C); 
% figure; imshow(data_loss_image);
%  figure;imshow(noisy_image);
% figure;imshow(D_data_loss); 
%  figure;imshow(D_noisy); 
% 
% % %  PSNR��SSIM
% % ����ԭʼͼ��
% P = imread('lena.jpg'); 
% imshow(uint8(P));
% title('Original Image');
% 
% % ��ԭʼͼ����м���
% C1 = Encryption_and_Decryption(P, 1, [0.1 0.1 0]);
% imshow(uint8(C1));
% title('Encrypted Image');
% imwrite(uint8(C1), 'lena_encrypted_image_1.bmp');
% 
% % ��ӽ�������
% noisyEncryptedImage = imnoise(C1, 'salt & pepper', 0.01);
% imshow(uint8(noisyEncryptedImage));
% title('Noisy Encrypted Image');
% imwrite(uint8(noisyEncryptedImage), 'lena_encrypted_image_noisy.bmp');
% 
% % ���ܼ����Ҵ�������ͼ��
% D_noisy = Encryption_and_Decryption(noisyEncryptedImage, 2, [0.1 0.1 0.1]);
% imshow(uint8(D_noisy));
% title('Decrypted Image from Noisy Encrypted Image');
% imwrite(uint8(D_noisy), 'lena_decrypted_image_from_noisy.bmp');
% 
% % ����PSNR��SSIM
% originalImage = double(P) / 255; % ��һ��ԭʼͼ��
% restoredImage = double(D_noisy) / 255; % ��һ���ָ�ͼ��
% 
% % PSNR
% psnrValue = psnr(restoredImage, originalImage);
% 
% % SSIM
% [ssimValue, ~] = ssim(restoredImage, originalImage);
% 
% % ��ʾ������
% fprintf('The PSNR value is: %0.4f dB\n', psnrValue);
% fprintf('The SSIM value is: %0.4f\n', ssimValue);
% 
