%��˹ƽ���˲����߽粻����
%���ȹ����˹�˲���
GaussianModelSD=10;
GaussianModelHalfLength=7;
GaussianModel=zeros(2*GaussianModelHalfLength+1);
for i =-GaussianModelHalfLength:GaussianModelHalfLength
    for j=-GaussianModelHalfLength:GaussianModelHalfLength
        GaussianModel(i+GaussianModelHalfLength+1,j+GaussianModelHalfLength+1)=...
            exp(-(i*i+j*j)/(2*GaussianModelSD*GaussianModelSD));
    end
end
% GaussianModel=GaussianModel/GaussianModel(1,1)*2;%����ɰ�ɫ��
GaussianModel=GaussianModel/sum(sum(GaussianModel));%�Ը�˹�˲������й�һ��
ImageInRGB=imread('G:\������\����ͼ����������Ӿ�\code_matlab\2\girl_Gaussian.png');
ImageIn=double(rgb2gray(ImageInRGB));
ImageOut=ImageIn;
for i=GaussianModelHalfLength+1:size(ImageIn,1)-GaussianModelHalfLength%��ȡ�߽粻����
    for j = GaussianModelHalfLength+1:size(ImageIn,2)-GaussianModelHalfLength
        ImageOut(i,j)=sum(sum(ImageIn(i-GaussianModelHalfLength:i+GaussianModelHalfLength,j-GaussianModelHalfLength:j+GaussianModelHalfLength).*GaussianModel));
    end
end
subplot(1,3,1);
imshow(uint8(ImageIn));
title('ԭͼ��');
subplot(1,3,2);
mesh(GaussianModel);
title('��˹�˲���');%Ч������һ��
subplot(1,3,3);
imshow(uint8(ImageOut));
title('�˲�֮����Ƭ');