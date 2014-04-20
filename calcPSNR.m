function [ psnr ] = calcPSNR( mse )
%CALCPSNR calculate Peak Signal-To-Noise Ratio
%   MAX in this function is the maximum possible pixel value of images
%   in this case (graysscale images) it equals 255 for non scaled image and
%   1 for scaled one
MAX = 1.0;
psnr = 10.0*(log10(((MAX*MAX)/mse)));
end

