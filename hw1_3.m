%ʵ��ƽ������������
ImageInRGB=imread('G:\������\����ͼ����������Ӿ�\code_matlab\2\apple2.png');
ImageIn=rgb2gray(ImageInRGB);
ImageSquare=uint8((double(ImageIn).^2)/255);
ImageSqrt=uint8((double(ImageIn).^0.5)/16*255);
subplot(1,3,1);
imshow(ImageIn);
title('ԭͼ��');
subplot(1,3,2);
imshow(ImageSquare);
title('ƽ����');
subplot(1,3,3);
imshow(ImageSqrt);
title('������');