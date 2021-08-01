%��˹ƽ���˲����߽粻����
%���ȹ����˹�˲���
GaussianModelSD=2;
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
subplot(1,4,1);
imshow(uint8(ImageIn));
title('ԭͼ��');
subplot(1,4,2);
mesh(GaussianModel);
title('��˹�˲���');%Ч������һ��
subplot(1,4,3);
imshow(uint8(ImageOut));
title('�˲�֮����Ƭ');

% %��Ե�����˲�
% ImageInRGB=imread('G:\������\����ͼ����������Ӿ�\code_matlab\2\apple.png');
% ImageIn=double(rgb2gray(ImageInRGB));
% % ImageIn=[0 1 1;0 0 1;0 0 1];
% ImageOut=ImageIn;
HalfLength=3;
for i =HalfLength+1:size(ImageIn,1)-HalfLength
    for j =HalfLength+1:size(ImageIn,2)-HalfLength
        average1=ImageIn(i-HalfLength:i,j:j+HalfLength);
        average2=ImageIn(i:i+HalfLength,j:j+HalfLength);
        average3=ImageIn(i-HalfLength:i,j-HalfLength:j);
        average4=ImageIn(i:i+HalfLength,j-HalfLength:j);
        Average=[average1 average2 average3 average4];
        v1=sum(sum(ImageIn(i-HalfLength:i,j:j+HalfLength).^2))-sum(sum(ImageIn(i-HalfLength:i,j:j+HalfLength)))^2/(HalfLength+1)^2;
        v2=sum(sum(ImageIn(i:i+HalfLength,j:j+HalfLength).^2))-sum(sum(ImageIn(i:i+HalfLength,j:j+HalfLength)))^2/(HalfLength+1)^2;
        v3=sum(sum(ImageIn(i-HalfLength:i,j-HalfLength:j).^2))-sum(sum(ImageIn(i-HalfLength:i,j-HalfLength:j)))^2/(HalfLength+1)^2;
        v4=sum(sum(ImageIn(i:i+HalfLength,j-HalfLength:j).^2))-sum(sum(ImageIn(i:i+HalfLength,j-HalfLength:j)))^2/(HalfLength+1)^2;
        [value,index]=min([v1 v2 v3 v4]);
        ImageOut(i,j)=Average(index);
    end
end
% subplot(1,2,1);
% imshow(uint8(ImageIn));
% title('ԭͼ��');
subplot(1,4,4);
imshow(uint8(ImageOut));
title('��Ե����');