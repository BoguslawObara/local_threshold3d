function th = niblack_threshold3d(im,n,k)
%%  niblack_threshold3d - Niblack's threshold algorithm 
%   
%   REFERENCE:
%       W. Niblack, An introduction to digitall image processing, 
%       Prentice-Hall, Englewood Cliffs, NJ, 1986
%
%       B. Obara, M. Roberts, J. Armitage, and V. Grau. 
%       Bioimage informatics approach for bacterial cells identification 
%       in Differential Interference Contrast microscopy images, 
%       BMC Bioinformatics, 14, 134, 2013
%
%       T. M. Scales, B. Obara, M. R. Holt, N. A. Hotchin, 
%       F. Berditchevski, and M. Parsons, α3β1 integrins regulate CD151 
%       complex assembly and membrane dynamics of carcinoma cells within 
%       3D environments, Oncogene, 32, 34, 3965-3979, 2013
%   
%   INPUT:
%       im      - input image
%       n       - window size, 15 
%       k       - weight value, normally in [-1,0], -0.2
%
%   OUTPUT:
%       th      - output image
%
%   HELP:
%       k > 0 - for images with white foreground objects 
%       k < 0 - for images with black foreground
% 
%   AUTHOR:
%       Boguslaw Obara

%% setup - fill in unset optional values
switch nargin
    case 1
        n = [3 3 3];
        k = -0.2;
    case 2
        k = -0.2;
end
%% convert image to gray scale
im = double(im2uint8(im));

%% kernel
h = double(fspecial3('ellipsoid',n)>0);

%% local mean
% m = sum(x)/n
m  = imfilter(im,h,'symmetric') / sum(h(:)); 

%% local lariance
% v = sum(x-m)^2/n = sum(x^2-2xm+m^2)/n = (sum(x^2)-2msum(x)+m^2)/n = 
%   = (sum(x^2)-2m^2+m^2)/n = sum(x^2)/n-m^2 
% v  = imfilter(im.^2,h,'symmetric') / numel(h) - m.^2; 
v  = imfilter(im.^2,h,'symmetric') / sum(h(:)) - m.^2;

%% local std
s = sqrt(v);

%% level
level = m + k * s;

%% threshold
th = im > level;

end