function [r,c,nccImg] = pyramidMatch(img, template, nLevels)
% -------------------------------------------------------------------------
% ���ý�����ƥ���㷨����ģ��ƥ��
%
% ���̣�(1)Ϊ��ƥ���ͼ���ģ��ͼ�񴴽�nLevels�������ͼ��
%       (2)�ӽ�������߲㿪ʼ����ƥ�䣬��߲��Ҫ��ȫɨ��ƥ�䣬�õ������ƥ��λ��
% �����²㴫�ݣ�����2�������ݴ��ݵ�λ�ã���5*5�Ĵ��ڷ�Χ�ڽ���ɨ��ƥ�䣬�������
% ֱ����Ͳ㡣
%       (3)ƥ��ʱ���õ������Զ���Ϊ��һ�����ϵ��
%       (4)����������ʱ�����˽���������2����Ȼ����2*2��ƽ���˲��������˴���
% 
% img-- Դͼ���������Ϊ�Ҷ�ͼ��
% template-- ģ��ͼ�񣨼���Ϊ�Ҷ�ͼ��
% nLevels-- ����������
% @r,c-- Դͼ������ƥ���λ��
% @nccImg-- ���н�����ƥ��ʱÿ���Ӧ�Ĺ�һ�����ϵ��ͼ��
%
% Author: L.L.He
% Time: 26/7/2014
%%-------------------------------------------------------------------------
imshow(img);
hold on;
[t_r,t_c] = size(template);
nccImg = cell(nLevels, 1);
% ��������ƥ��ͼ���ģ���ͼ�������
nStep = 2; %5*5
srcPrad = pyramid(img, nLevels);
temPrad = pyramid(template, nLevels);
[r,c,nccImg{nLevels}] = matchTemplate(srcPrad{nLevels}, temPrad{nLevels});
for i=nLevels-1:-1:1
    r_start = 2*r - floor((size(temPrad{i},1)-1)/2) - nStep;
    r_end = r_start+2*nStep+1;
    c_start = 2*c - floor((size(temPrad{i},2)-1)/2) - nStep;
    c_end = c_start++2*nStep+1;
    [r,c,nccImg{i}] = matchTemplate(srcPrad{i}, temPrad{i},...
                      r_start, r_end, c_start, c_end);
end
c_r = round(t_r/2);
c_c = round(t_c/2);
rectangle('Position',[c-c_c+1,r-c_r+1,t_c,t_r], 'edgecolor', 'r');
end
% -------------------------------------------------------------------------

% =========================================================================
% ģ��ƥ���㷨
function [objr, objc, ncc_Img] = matchTemplate(img, template, r_start, ...
                                r_end, c_start, c_end)
[src_r,src_c] = size(img);
[t_r,t_c] = size(template);
if nargin == 2
    r_start = 1;
    r_end = src_r-t_r+1;
    c_start = 1;
    c_end = src_c-t_c+1;
end
% �����ȼ���ģ��ͼ��Ĺ�һ��ͼ��
norm_Img = normalize(template);
ncc_Img = zeros(r_end-r_start+1, c_end-c_start+1);
c_r = round(t_r/2);
c_c = round(t_c/2);
for r = r_start:r_end
    for c = c_start:c_end
        currPatch = img(r:r+t_r-1,c:c+t_c-1);
        currPatch = normalize(currPatch);
        ncc_Img(r+c_r-1,c+c_c-1) = NCC(norm_Img, currPatch);
    end
end
[val_1,pos] = max(ncc_Img);
[val_2,objc] = max(val_1);
objr= pos(find(val_1==val_2));
end
% =========================================================================

% =========================================================================
% ��������ͼ��Ĺ�һ�����ϵ����һ�������Զ������������ֵԽ���ʾԽ����
function ncc = NCC(img_1, img_2, isNorm)
if ~exist('isNorm','var')
    isNorm = 1;
end
% �жϲ����Ƿ��ǹ�һ�����ͼ��
if ~isNorm
    img_1 = normalize(img_1);
    img_2 = normalize(img_2);
end
ncc = sum(sum(img_1.*img_2)) ./ size(img_1(:),1);
end
% =========================================================================

% =========================================================================
% ͼ���һ��
function norm_Img = normalize(img)
if size(img, 3) ~= 1
    img = rgb2gray(img);
end
norm_Img = zeros(size(img));
mu = mean(img(:));
st = max(std(double(img(:))), eps);
norm_Img = bsxfun(@minus, img, mu);
norm_Img = bsxfun(@rdivide, norm_Img, st);
end
% =========================================================================

% =========================================================================
% ����ͼ��Ľ�������������nLevels����ָ��,����һ���ṹ�壬���а���nLevels��ͼ��
function pyImg = pyramid(img, nLevels)
% �����������е�ÿһ��ͼ��
pyImg = cell(nLevels, 1);
pyImg{1} = img;
for i=2:nLevels
    pyImg{i} = downSample(pyImg{i-1});
end  
end
% =========================================================================

% =========================================================================
% ��ͼ����н�����(2*2)��ƽ������
function d_img = downSample(img)
% ���ԭͼ��������ǻ�������
if mod(size(img,1), 2) ~= 0
    img = [img(1,:); img];
end
if mod(size(img,2), 2) ~= 0
    img = [img(:,1), img];
end
[r,c] = size(img);
d_img = zeros(r/2, c/2);
for i=1:2:r
    for j=1:2:c
        x = (i+1)/2;
        y = (j+1)/2;
        d_img(x,y) = sum(sum(img(i:i+1,j:j+1)))/4;
    end
end
end