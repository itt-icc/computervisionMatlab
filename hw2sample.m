%��ֵƽ����
ImageInRGB=imread('G:\������\����ͼ����������Ӿ�\code_matlab\2\castle.png');
ImageIn=rgb2gray(ImageInRGB);
ImageOut=ImageIn;
ImageIn=double(ImageIn);
MeanOperator=ones(3,3)/9;
iOperator=MeanOperator;
for i=2:size(ImageIn,1)-1%��ȡ�߽粻����
    for j = 2:size(ImageIn,2)-1
        ImageOut(i,j)=sum(sum(ImageIn(i-1:i+1,j-1:j+1).*iOperator));
    end
end
%��ʾͼ��
subplot(1,2,1);
imshow(uint8(ImageIn));
title('ԭͼ��');
subplot(1,2,2);
imshow(ImageOut);
title('��ֵƽ��');
