function th = median_threshold3d(im,n,c)
%%  median_threshold3d - Median's threshold algorithm 
%   
%   REFERENCE:
%       B. Obara, M. Roberts, J. Armitage, and V. Grau. 
%       Bioimage informatics approach for bacterial cells identification 
%       in Differential Interference Contrast microscopy images, 
%       BMC Bioinformatics, 14, 134, 2013
%   
%   INPUT:
%       im      - input image
%       n       - window size, 15 
%       c       - constant value, 0
%
%   OUTPUT:
%       th      - output image
% 
%   AUTHOR:
%       Boguslaw Obara

%% setup - fill in unset optional values
switch nargin
    case 1
        n = [3 3 3];
        c = 0;
    case 2
        c = 0;
end

%% convert image to gray scale
im = double(im2uint8(im));

%% Kernel
h = double(fspecial3('ellipsoid',n)>0);

%% local median
disp('TODO: ordfilt3 function must handle user-defined neighborhood !!!')
th = false(size(im));

% m  = ordfilt3(im,median(1:sum(h(:))),h,'symmetric');

%% level
% level = m - c ;

%% threshold
% th = im > level;

end