clc;clear;close all;

I = imread('Erdbeere.png');
subplot(2,3,1);imshow(I);title('ԭʼͼ��');

I_gray = rgb2gray(I);
subplot(2,3,2);imshow(I_gray);title('�Ҷ�ͼ��');

subplot(2,3,3);imhist(I_gray);title('�Ҷ�ֱ��ͼ');

[width,height]=size(I_gray);
threshold=180;
for i=1:width
    for j=1:height
        if(I_gray(i,j)<threshold)
            BW(i,j)=1;
        else 
            BW(i,j)=0;
        end
    end
end
subplot(2,3,4);imshow(BW);title('�˹���ֵ���зָ�');
%subplot(1,3,1);imshow(BW);title('�˹���ֵ���зָ�');
SE1 = strel('disk',1);
J = imopen (BW,SE1);
%subplot(1,3,2);imshow(J);title('�ȿ�����');
SE2 = strel('disk',3);
J = imclose (J,SE2);
%subplot(1,3,3);imshow(J);title('�ٱ�����');
subplot(2,3,5);imshow(J);title('��̬ѧ����');

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
result(:,:,1) = R.*uint8(J);
result(:,:,2) = G.*uint8(J);
result(:,:,3) = B.*uint8(J);
%figure();imshow(result);title('ͼ��ָ���');
subplot(2,3,6);imshow(result);title('ͼ��ָ���');
imwrite(result,'ͼ��ָ���.png');
