%��ֵƽ��
ImageInRGB=imread('G:\������\����ͼ����������Ӿ�\code_matlab\2\castle.png');
ImageIn=rgb2gray(ImageInRGB);
ImageIn=double(ImageIn);
ImageOut=ImageIn;
MeanOperator=ones(3,3)/9;
iOperator=MeanOperator;
T=20;%������ֵ
for i=2:size(ImageIn,1)-1%��ȡ�߽粻����
    for j = 2:size(ImageIn,2)-1
        if abs(ImageOut(i,j)-sum(sum(ImageIn(i-1:i+1,j-1:j+1).*iOperator)))>=T
            ImageOut(i,j)=sum(sum(ImageIn(i-1:i+1,j-1:j+1).*iOperator));
        end
    end
end
%��ʾͼ��
subplot(1,2,1);
imshow(uint8(ImageIn));
title('ԭͼ��');
subplot(1,2,2);
imshow(uint8(ImageOut));
title('��ֵƽ��');%�ͼ򵥵ľ�ֵƽ�����Ա�
