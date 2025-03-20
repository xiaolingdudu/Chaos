% %  PSNR和SSIM
% 加载原始图像
P = imread('lena.jpg'); 
imshow(uint8(P));
title('Original Image');

% 对原始图像进行加密
C1 = Encryption_and_Decryption(P, 1, [0.1 0.1 0]);
imshow(uint8(C1));
title('Encrypted Image');
imwrite(uint8(C1), 'lena_encrypted_image_1.bmp');

% 添加椒盐噪声
noisyEncryptedImage = imnoise(C1, 'salt & pepper', 0.01);
imshow(uint8(noisyEncryptedImage));
title('Noisy Encrypted Image');
imwrite(uint8(noisyEncryptedImage), 'lena_encrypted_image_noisy.bmp');

% 解密加密且带噪声的图像
D_noisy = Encryption_and_Decryption(noisyEncryptedImage, 2, [0.1 0.1 0]);
imshow(uint8(D_noisy));
title('Decrypted Image from Noisy Encrypted Image');
imwrite(uint8(D_noisy), 'lena_decrypted_image_from_noisy.bmp');

% 计算PSNR和SSIM
originalImage = double(P) / 255; % 归一化原始图像
restoredImage = double(D_noisy) / 255; % 归一化恢复图像

% PSNR
psnrValue = psnr(restoredImage, originalImage);

% SSIM
[ssimValue, ~] = ssim(restoredImage, originalImage);

% 显示计算结果
fprintf('The PSNR value is: %0.4f dB\n', psnrValue);
fprintf('The SSIM value is: %0.4f\n', ssimValue);

