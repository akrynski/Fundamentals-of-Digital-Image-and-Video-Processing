function [ error ] = calcMSE( img1, img2 )
%MSE compute Mean Squared Error
% 1/N1*N2 sum from n1=1 to N1 sum from n2=1 to N2 [x(n1.n2)-y(n1,n2)]^2
imgSize = size(img1);
N1 = imgSize(1);
N2 = imgSize(2);
%n=0.0;
error=0.0;
for n1=1:N1
    for n2=1:N2
    %n = (img1(n1,n2) - img2(n1,n2));%^2
    %error = error+((n*n)/(N1*N1));%(1/(N1*N2))*n;
    error = error + (img1(n1,n2) - img2(n1,n2))^2;
    end
end
error = error/(N1*N2);
% right result is MSE = 76.483235 and MSE = 173.671844
% what gives PSNR = 29.30 and PSNR = 25.73
%% simplier vectorizing matrices: mse = sum( (x(:) - y(:)).^2 ) / numel(x);
end

