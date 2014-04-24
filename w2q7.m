%W2Q7 my answer to question 7 of week's 2 homework at Coursera's Introduction to Image and Video Processing
set(0,'DefaultFigureWindowStyle','docked');%use tabs to show figures in one window
clear;clc;
%img64=double(imread('digital-images-week2_quizzes-lena.gif'))/255.0;%scaling
%img64 = im2double(imread('test.png'),'indexed')/255;%scaling
img64= im2double(imread('digital-images-week2_quizzes-lena.gif'));

figure('Units', 'pixels');
%figure(1);
subplot(2,3,1);
imagesc(img64);colormap(gray);
axis image; %corrects aspect ratio
title('original image (scaled to double)');
set(gca,'XTick',[0,10:20:256]);
Lo3x3=ones(3,3).*(1/9);
filtered1 = imfilter(img64,Lo3x3,'replicate');
%figure(2);
subplot(2,3,2);
imagesc(filtered1);colormap(gray);axis image;
title('original filtered by lopass 3x3 filter');
tic;
MSE = calcMSE(img64,filtered1);
toc
tic;
MSE=sum( (img64(:) - filtered1(:)).^2 ) / numel(img64);
toc;
 tic;
% MSE=sum((sum(img64-filtered1)).^2)/numel(img64);
MSE=sum(sum((img64-filtered1).^2))/numel(img64);
 toc
fprintf('MSE = %f\n', MSE);
PSNR = calcPSNR(MSE);
fprintf('PSNR = %.2f\n', PSNR);
Lo5x5=ones(5,5).*(1/25);
filtered2 = imfilter(img64,Lo5x5,'replicate');
%%figure(3);
subplot(2,3,3);
imagesc(filtered2);colormap(gray);axis image;
title('original filtered by lopass 5x5 filter');
MSE = calcMSE(img64,filtered2);
fprintf('MSE = %f\n', MSE);
PSNR = calcPSNR(MSE);
fprintf('PSNR = %.2f\n', PSNR);
%------------------------------------------------------------------
s=subplot(234);
colormap('jet');
mesh(Lo5x5,'EdgeColor','r'),axis([-1,6,-1,6,-1,1]);
colormap(gray),legend('all fields = 0.25','Location','Best'),title('flat lopas 5x5 filter');
%------------------------------------------------------------------
[ssimval, ssimmap] = ssim(img64,filtered1);
fprintf('SSIM = %.2f\n', ssimval);
subplot(2,3,5);
imagesc(ssimmap),axis image;
xlabel('ssim is better, human acceptable coefficient of differencebetween original and filtered image');
title(sprintf('ssim Index Map\n - Mean ssim Value is %0.4f',ssimval));
[ssimval, ssimmap] = ssim(img64,filtered2);
fprintf('SSIM = %.2f\n', ssimval);
subplot(2,3,6);
imagesc(ssimmap),axis image;
title(sprintf('ssim Index Map\n - Mean ssim Value is %0.4f',ssimval));
