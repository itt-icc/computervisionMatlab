%����MER
I=imread('apple2.png');
bw=im2bw(I); %#ok<*IM2BW>
bw=~bw;
areas=zeros(1,90);
for i = 1:90
    bw2=imrotate(bw,i,'crop');
    [~,~,area] = minrectangle(bw2);
    areas(i)=area;
end
%�����С��ʱ��
[area_value,index]=min(areas);
bw2=imrotate(bw,index,'crop');
[rectx,recty,area] = minrectangle(bw2);
subplot(131)
imshow(I);
title('ԭͼ��');
subplot(132)
imshow(bw);
title('0��');
subplot(133)
imshow(bw2);
title('60��');
hold on
line(rectx,recty);
%ʵ�ֺ���
function [rectx,recty,area] = minrectangle(image)
[y,x]=find(image==1);%Ѱ�������ĺ���
%�ҳ�����ߵĵ�
[value,index]=min(x);
left=[value,y(index)];
%������ĵ�
[value,index]=max(x);
right=[value,y(index)];
%������ĵ�
[value,index]=max(y);
down=[x(index),value];
%������ĵ�
[value,index]=min(y);
top=[x(index),value];
%������Ӿ���
rectx=[left(1);left(1);right(1);right(1);left(1)];
recty=[down(2);top(2);top(2);down(2);down(2)];
width=abs(top(2)-down(2));
length=abs(left(1)-right(1));
area=width*length;%��Ӿ��ε����
end