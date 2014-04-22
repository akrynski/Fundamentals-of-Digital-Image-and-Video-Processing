%W4Q8  my homework of block matching motion estimation between two consecutive video frames
clear;
I_1=double(imread('digital-images-week4_quizzes-frame_1.jpg'));
I_2=double(imread('digital-images-week4_quizzes-frame_2.jpg'));
B_target=I_2(65:96,81:112);
B_face=zeros(size(B_target));
MxN=33*32;%B_target's width*height
B_source=I_1((1:32),(1:32));
MAE_min=sum(abs(B_source(:)-B_target(:)))/MxN;
Mmin = 1;
Nmin = 1;
for m=1:size(I_1,1)-31
    for n=1:size(I_1,2)-31
        B_source=I_1(m:m+31,n:n+31);
        MAE=sum(abs(B_target(:)-B_source(:)))/MxN;
        if(MAE<MAE_min)
            MAE_min=MAE;
            Mmin=m;
            Nmin=n;
            B_face=B_source;
        end
    end
end
fprintf('MAE at location (%d,%d) equals to %f\n',Mmin,Nmin,MAE_min);
figure;
subplot(141);
imagesc(I_1),axis image,colormap(gray),title('frame 1');
rectangle('Position',[Nmin,Mmin,32,32],'LineWidth',2,'EdgeColor','y');
subplot(142);
imagesc(I_2),axis image,colormap(gray),title('frame 2');
rectangle('Position',[Nmin,Mmin,32,32],'LineWidth',2,'EdgeColor','g');
subplot(143);
imagesc(B_face),axis image,colormap(gray),title('reference block');
subplot(144);
[ssimval,ssimmap]=ssim(B_face,B_target);
imagesc(ssimmap),axis image,colormap(gray),title('difference found (ssim-map)');
fprintf('ssimval=%f\n',ssimval);

