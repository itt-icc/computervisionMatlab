%ʵ��ֱ��ͼ���⻯
ImageInRGB=imread('G:\������\����ͼ����������Ӿ�\code_matlab\2\apple2.png');
ImageIn=rgb2gray(ImageInRGB);
ImageGray=0:255;%������
ImageBar=ImageGray;
ImageSize=size(ImageIn,1)*size(ImageIn,2);%ͼ���С
for i = 1:size(ImageGray,2)%��Ƶ��
    ImageBar(i)=sum(sum(ImageIn==ImageGray(i)));
end
ImageBar=ImageBar/ImageSize;%����Ƶ��
ImageBarNew=ImageBar;
for i = 2:size(ImageBarNew,2)%�����ۻ�ֱ��ͼ
    ImageBarNew(i)=ImageBarNew(i-1)+ImageBar(i);%����
end
bar(ImageGray,ImageBarNew);%�ۻ�ֱ��ͼ

%ֱ��ͼ�任
ImageShow=ImageIn;
for i =1:size(ImageIn,1)
    for j = 1:size(ImageIn,2)
        ImageShow(i,j)=uint8(ImageBarNew(ImageIn(i,j)+1)*255);%�Ҷ�ֵ��Ӧ�ĻҶ�ֵ�ĸ����ٳ���255
    end
end
%�µ�ֱ��ͼ
for i =1:size(ImageGray,2)
    ImageBarNew(i)=sum(sum(ImageShow==ImageGray(i)));
end
ImageBarNew=ImageBarNew/ImageSize;%����Ƶ��
subplot(221)
imshow(ImageIn);title('ԭͼ��');
subplot(222)
imshow(ImageShow);title('���⻯ͼ��');
subplot(223)
bar(ImageGray,ImageBar);title('ԭͼ��ֱ��ͼ');
subplot(224)
bar(ImageGray,ImageBarNew);title('��ͼ��ֱ��ͼ');