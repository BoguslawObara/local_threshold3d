%% clear
clc; clear all; close all;

%% path
addpath('./lib')

%% load image
im = imread3d('./im/coral.tif');

%% normalize
im = double(im); im = (im - min(im(:))) / (max(im(:)) - min(im(:)));

%% filter
n = [15 15 2];
h = fspecial3('log',n);
im  = imfilter(im,h,'symmetric'); 

%% local thresholding
n = [15 15 2];

c = 0;
imth1 = mean_threshold3d(im,n,c);

c = 0;
imth2 = median_threshold3d(im,n,c);

c = 0;
imth3 = mid_grey_threshold3d(im,n,c);

k = -0.2;
imth4 = niblack_threshold3d(im,n,k);

c = n(1);
imth5 = bernsen_threshold3d(im,n,c);

k = 0.5; R = 128;
imth6 = sauvola_threshold3d(im,n,k,R);

%% plot
figure,
imagesc(max(im,[],3)); title('Input'); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;

figure,
subplot(2,3,1), imagesc(max(imth1,[],3)); title('Mean'); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;

subplot(2,3,2), imagesc(max(imth2,[],3)); title('Median'); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;

subplot(2,3,3), imagesc(max(imth3,[],3)); title('MidGrey'); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;

subplot(2,3,4), imagesc(max(imth4,[],3)); title('Niblack'); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;

subplot(2,3,5), imagesc(max(imth5,[],3)); title('Bernsen'); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;

subplot(2,3,6), imagesc(max(imth6,[],3)); title('Sauvola'); colormap gray; 
set(gca,'ytick',[]); set(gca,'xtick',[]); axis image; axis tight;