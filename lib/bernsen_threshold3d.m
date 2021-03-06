function th = bernsen_threshold3d(im,n,c)
%%  bernsen_threshold3d - Bernsen's threshold algorithm 
%   
%   REFERENCE:
%       M. Sezgin and B. Sankur,
%       Survey over image thresholding techniques 
%       and quantitative performance evaluation, 
%       Journal of Electronic Imaging, 13, 1, 146-165, 2004
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
%       n       - window size, 31
%       c       - constant threshold value, 15
%
%   OUTPUT:
%       th      - output image
%
%   AUTHOR:
%       Boguslaw Obara

%% setup - fill in unset optional values.
switch nargin
    case 1
        n = [3 3 3];
        c = 15;
    case 2
        c = 15;
end

%% convert image to gray scale
im = double(im2uint8(im));

%% kernel
h = double(fspecial3('ellipsoid',n)>0);

%% local min
lmin = imerode(im,h);

%% local max
lmax = imdilate(im,h);

%% local contrast
lc = lmax - lmin;

%% middle gray
mg = (lmin + lmax)/2;

%% if by indexing
ix1 = lc < c;
ix2 = lc >= c;

%% threshold
th = zeros(size(im))==1;
th(ix1) = mg(ix1) >= 128;
th(ix2) = im(ix2) >= mg(ix2);

end