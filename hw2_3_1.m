%����ʽ��ֵѡ�񣬱���ͼ������ʾ���ָǷ�ָ�
%1���������ԭͼ�ϣ��������Ƿ�¶���������Ƿ���ǰ�ָ�����
%2����������ԭͼ��
ImageInRGB=imread('G:\������\����ͼ����������Ӿ�\code_matlab\2\apple2.png');
ImageIn=(rgb2gray(ImageInRGB));
imshow(ImageIn);
%����ֱ��ͼ
ImageGray=0:255;
ImageBar=ImageGray;
for i=1:size(ImageGray,2)%��Ƶ��
    ImageBar(i)=sum(sum(ImageIn==ImageGray(i)));
end
bar(ImageGray,ImageBar);%ֱ��ͼ

ImageBarBig0=find(ImageBar>0);%�ҳ�ͼ���������ص��
Th=(ImageBarBig0(1)+ImageBarBig0(end))/2;%��ֵ��ʼ��
ImageIn=double(ImageIn);

Image1=double(ImageIn<Th);%��ֵͼ
S1=sum(sum(Image1));%�õ�С����ֵ�����ص�����
u1=sum(sum(Image1.*ImageIn))/S1;%�ҶȾ�ֵ

Image2=double(ImageIn>Th);%��ֵͼ
S2=sum(sum(Image2));%�õ�С����ֵ�����ص�����
u2=sum(sum(Image2.*ImageIn))/S2;%�ҶȾ�ֵ

u1_old=u1-1;%��֤����ѭ��
while u1_old~=u1
    u1_old=u1;
    u2_old=u2;
    Th=(u1+u2)/2;
    Image1=double(ImageIn<Th);%��ֵͼ
    S1=sum(sum(Image1));%�õ�С����ֵ�����ص�����
    u1=sum(sum(Image1.*ImageIn))/S1;%�ҶȾ�ֵ

    Image2=double(ImageIn>Th);%��ֵͼ
    S2=sum(sum(Image2));%�õ�С����ֵ�����ص�����
    u2=sum(sum(Image2.*ImageIn))/S2;%�ҶȾ�ֵ
end
ImageOut0=ImageIn>Th;
ImageIn0=ImageIn;
ImageOut=uint8(ImageIn>Th)*255;
ImageIn=uint8(ImageIn);

subplot(131);
imshow(ImageIn);
title('ԭͼ��');
subplot(132);
imshow(ImageOut);
title('�����ָ�');
subplot(133);
imshow(uint8(ImageOut0.*ImageIn0));
title('�ָ�Ч��');