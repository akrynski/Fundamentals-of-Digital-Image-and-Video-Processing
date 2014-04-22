%W3Q8 my answer to question 8 of week's 3 homework at Coursera's Introduction to Image and Video Processing

%-------------------load the imagge, convert it to double and scale to 0:1 array
img64= im2double(imread('digital-images-week3_quizzes-original_quiz.jpg'));
%--------------------------------down-sample the image------------------------------------
Lo3x3=ones(3,3).*(1/9);
filtered1=imfilter(img64,Lo3x3,'replicate');
subplot(2,3,1);
imagesc(img64),axis image,colormap(gray),title('Original image 479x359');
subplot(2,3,2);
imagesc(filtered1),axis image,colormap(gray),title('lopas filtered');
%---------------------------------------------------------------------------------------
[height, width]=size(filtered1);%rows,columns
d_scaled=zeros(uint8(height/2),uint8(width/2));
i=1; j=1;
for x=1:2:height
    for y=1:2:width
        d_scaled(i,j)=filtered1(x,y);
        j=j+1;
    end
 i=i+1;
 j=1;
end
subplot(2,3,3);
[rows, cols]=size(d_scaled);
imagesc(d_scaled),axis image,colormap(gray);
title(['down-sampled to ',num2str(cols),'x',num2str(rows)]);
%--------------------------------up-sampling via spatial domain processing--------
up_scaled=zeros(359,479);
[height, width]=size(up_scaled);%rows,columns
for i=1:2:height
    for j=1:2:width
        up_scaled(i,j)=d_scaled((i+1)/2,(j+1)/2);
    end
end
subplot(2,3,4);
imagesc(up_scaled),axis image,colormap(gray),title('inserted zeros to down-sampled image');
%figure(2);
%imagesc(up_scaled),colormap(gray);
coefficients=[0.25,0.5,0.25;0.5,1.0,0.5;0.25,0.5,0.25];
filtered2=imfilter(up_scaled,coefficients);
sub=subplot(2,3,5);
imagesc(filtered2),axis image,colormap(gray),title({'Convolved with';' .25 .5 .25';'.5  1  .5';'.25 .5 .25'});

%------------------------------compute Peak to Signal Noise Ratio----------------
MSE = calcMSE(img64,filtered2);
fprintf('MSE = %f\n', MSE);
PSNR = calcPSNR(MSE);
fprintf('PSNR = %.2f\n', PSNR);
xlabel(sub,...
    {'So after convolution we have';' image up-sampled to original size'});
ylabel(sub,['PSNR=',num2str(PSNR)]);
%The result is MSE = 0.001522, PSNR = 28.18
%-----------------------------show the spectrum of resulting image----------
%subplot(236);
%mesh(10*log10(abs(conv2(filtered2,filtered2))));%,axis image,title('spectrum of resulting image');
psd = 10*log10(abs(fftshift(fft2(filtered2,512,512))).^2 ); %using abs shows module of fft /512-zero padding/
%imagesc(psd),axis image,title('spectrum of resulting image');
figure(2);
mesh(psd),axis image,colormap(jet); colorbar;%colormap('hot');% try stem
clear;
