clear all; clc; close all;

% Load the original image
P = imread('lena.jpg');

% Display the original image
figure(1);
imshow(uint8(P));
title('Original Image');

% Begin measuring time for the encryption process
encryptionStartTime = tic;

% Perform the encryption process
C1 = Encryption_and_Decryption(P, 1, [0.1 0.1 0]);

% End measuring time for the encryption process
encryptionEndTime = toc(encryptionStartTime);

% Display the encrypted image
figure(2);
imshow(uint8(C1));
title('Encrypted Image');

% Save the encrypted image
imwrite(uint8(C1), 'lena_encrypted_image_1.bmp');

% Display the time taken for the encryption process
fprintf('Time taken for the encryption process: %.3f seconds.\n', encryptionEndTime);
