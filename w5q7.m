%% W5Q7 my homework with noise removing from an image
%
%%
clear;clc;
noisy=double(imread('digital-images-week5_quizzes-noisy.jpg'))/255.0;
original=double(imread('digital-images-week5_quizzes-original.jpg'))/255.0;
figure;
subplot(321);imshow(noisy);title('noisy');
subplot(322);imshow(original);title('original');
filtered1=medfilt2(noisy,[3,3]);
subplot(323);imshow(filtered1);title('3x3 median filter');
filtered2=medfilt2(filtered1,[3,3]);
subplot(324);imshow(filtered2);title({'3x3 median filter','second pass'});
PSNR_o_n=calcPSNR(calcMSE(original,noisy));
PSNR_o_f1=calcPSNR(calcMSE(original,filtered1));
PSNR_o_f2=calcPSNR(calcMSE(original,filtered2));
fprintf('PSNR values between noise-free and\nnoisy: %.2f\nfiltered - 1st step: %.2f\nfiltered 2nd step: %.2f\n',...
    PSNR_o_n,PSNR_o_f1,PSNR_o_f2);
    
%%------------------------------------
%PSNR values between noise-free and
%noisy: 11.33
%filtered - 1st step: 27.38
%filtered 2nd step: 29.65
%%
