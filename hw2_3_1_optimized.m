%����ʽ��ֵѡ�񣬱���ͼ������ʾ���ָǷ�ָ�
%1���������ԭͼ�ϣ��������Ƿ�¶���������Ƿ���ǰ�ָ�����
%2����������ԭͼ��
ImageInRGB=imread('G:\������\����ͼ����������Ӿ�\code_matlab\2\apple2.png');
ImageIn=(rgb2gray(ImageInRGB));
% imshow(ImageIn);
%����ֱ��ͼ
ImageGray=0:255;
ImageBar=ImageGray;
for i=1:size(ImageGray,2)%��Ƶ��
    ImageBar(i)=sum(sum(ImageIn==ImageGray(i)));
end
% bar(ImageGray,ImageBar);%ֱ��ͼ

ImageBarBig0=find(ImageBar>0);%�ҳ�ͼ���������ص��
Th=round((ImageBarBig0(1)+ImageBarBig0(end))/2);%��ֵ��ʼ��
ImageIn=double(ImageIn);

u1=sum(ImageBar(1:Th+1).*(0:Th))/sum(ImageBar(1:Th+1));%����ֱ��ͼ���м���
u2=sum(ImageBar(Th+2:256).*(Th+1:255))/sum(ImageBar(Th+2:256));


u1_old=u1-1;%��֤����ѭ��
while u1_old~=u1
    u1_old=u1;
    u2_old=u2;
    Th=round((u1+u2)/2);
    u1=sum(ImageBar(1:Th+1).*(0:Th))/sum(ImageBar(1:Th+1));
    u2=sum(ImageBar(Th+2:256).*(Th+1:255))/sum(ImageBar(Th+2:256));
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