%��ֵ�˲�
ImageInRGB=imread('G:\������\����ͼ����������Ӿ�\code_matlab\2\girl_Gaussian.png');
ImageIn=double(rgb2gray(ImageInRGB));
ImageOut=ImageIn;
MedianModelHalfLength=2;
MedianModelSize=(2*MedianModelHalfLength+1)^2;
MedianModelMidelPos=MedianModelHalfLength*MedianModelHalfLength*2+MedianModelHalfLength*2+1;
for i=MedianModelHalfLength+1:size(ImageIn,1)-MedianModelHalfLength%��ȡ�߽粻����
    for j = MedianModelHalfLength+1:size(ImageIn,2)-MedianModelHalfLength
        MedianModel=ImageIn(i-MedianModelHalfLength:i+MedianModelHalfLength,j-MedianModelHalfLength:j+MedianModelHalfLength);
        MedianModelLine=reshape(MedianModel,1,MedianModelSize);
        MedianModelLine=sort(MedianModelLine);
        ImageOut(i,j)=MedianModelLine(MedianModelMidelPos);
    end
end
subplot(1,2,1);
imshow(uint8(ImageIn));
title('ԭͼ��');
subplot(1,2,2);
imshow(uint8(ImageOut));
title('�˲�֮����Ƭ');