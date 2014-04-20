%img64=double(imread('digital-images-week2_quizzes-lena.gif'))/255.0;%scaling
img64 = im2double(imread('test.png'),'indexed')/255;%scaling
%img64= im2double(imread('digital-images-week2_quizzes-lena.gif'));

figure('Units', 'pixels');
figure(1);
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
%MSE = calcMSE(img64,filtered1);
MSE=sum( (img64(:) - filtered1(:)).^2 ) / numel(img64);
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
%---------------------------------------------------------
% t2w=wiener2(filtered2,[7,7]);
% subplot(2,3,5);
% imagesc(t2w);colormap(gray);axis image;
% title('WIENER FILTER ON IMG 2,3,3 (THIRD IN THE FIRST ROW)');
% u=[0,-1,0;-1,5,-1;0,-1,0];
% laplacian = imfilter(filtered2,u,'replicate');
% subplot(2,3,5);
% imagesc(laplacian);colormap(gray);axis image;