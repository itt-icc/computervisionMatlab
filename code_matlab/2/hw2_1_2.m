%�����ͨ�˲�,�������Ǹ�ͨ�ź�
ImageInRGB=imread('G:\������\����ͼ����������Ӿ�\code_matlab\2\castle.png');
ImageIn=rgb2gray(ImageInRGB);
ImageOut1=ImageIn;
ImageOut2=ImageIn;
ImageIn=double(ImageIn);
operator1=[1/10 1/10 1/10;1/10 1/10 1/10;1/10 1/10 1/10];
operator2=[1/16 1/8 1/16;1/8 1/4 1/8;1/16 1/8 1/16];
for i=2:size(ImageIn,1)-1%��ȡ�߽粻����
    for j = 2:size(ImageIn,2)-1
        ImageOut1(i,j)=sum(sum(ImageIn(i-1:i+1,j-1:j+1).*operator1));
    end
end
for i=2:size(ImageIn,1)-1%��ȡ�߽粻����
    for j = 2:size(ImageIn,2)-1
        ImageOut2(i,j)=sum(sum(ImageIn(i-1:i+1,j-1:j+1).*operator2));
    end
end
%��ʾͼ��
subplot(1,3,1);
imshow(uint8(ImageIn));
title('ԭͼ��');
subplot(1,3,2);
imshow(ImageOut1);
title('�����ͨ�˲�����1');%Ч������һ��
subplot(1,3,3);
imshow(ImageOut2);
title('�����ͨ�˲�����2');