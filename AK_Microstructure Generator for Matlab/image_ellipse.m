function ret = image_ellipse(a0, b0, theta0, n0)
% Set the elements of the Matrix Image which are in the interior of the
% ellipse E with the value 'color'. The ellipse E has center (y0, x0), the
% major axe = a, the minor axe = b, and theta is the angle macked by the
% major axe with the orizontal axe.
% ellipseMatrix(y0, x0, a, b, theta,exponent, Image, color)
%
% Function:  ellipseMatrix
% Version:   1.1
% Author:    Nicolae Cindea

%y0 = 0; x0 = 0; a0 = 100, b0 = 50, theta = 0; n0=2 color = 1;

%%im = zeros(x0 + round(1.5*a0),y0 + round(1.5*a0));
im = zeros(3*a0,3*a0); % 3a0 x 3a0 matrix all filled with 0 
x0 = 1.5*a0; % value 
y0 = 1.5*a0; % value


%im = Image;
[nx, ny] = size(im); % value nx and value ny
imtemp = zeros(nx, ny);% same as im but we use this later on to play with before saving to im.
list = zeros(nx * ny, 2); % 2 column 
toplist = 1;


x0 = round(x0);
y0 = round(y0);
list(toplist, 1) = x0;
list(toplist, 2) = y0;
im(x0, y0) = 1;

while (toplist > 0)
    x = list(toplist, 1);
    y = list(toplist, 2);
    toplist = toplist - 1;
    
    if local_isValid(x, y + 1, x0, y0, a0, b0, theta0,n0, imtemp, nx, ny, 1)==1
        toplist = toplist + 1;
        list(toplist, 1) = x;
        list(toplist, 2) = y + 1;
        im(list(toplist, 1), list(toplist, 2)) = 1; 
        imtemp(list(toplist, 1), list(toplist, 2)) = 1;      
    end
    if local_isValid(x - 1, y, x0, y0, a0, b0, theta0,n0, imtemp, nx, ny, 1)==1
        toplist = toplist + 1;
        list(toplist, 1) = x - 1;
        list(toplist, 2) = y;
        im(list(toplist, 1), list(toplist, 2)) = 1;
        imtemp(list(toplist, 1), list(toplist, 2)) = 1;
    end
    if local_isValid(x, y - 1, x0, y0, a0, b0, theta0,n0, imtemp, nx, ny, 1)==1
        toplist = toplist + 1;
        list(toplist, 1) = x;
        list(toplist, 2) = y - 1;
        im(list(toplist, 1), list(toplist, 2)) = 1;
        imtemp(list(toplist, 1), list(toplist, 2)) = 1;        
    end
    if local_isValid(x + 1, y, x0, y0, a0, b0, theta0,n0, imtemp, nx, ny, 1) == 1
        toplist = toplist + 1;
        list(toplist, 1) = x + 1;
        list(toplist, 2) = y;
        im(list(toplist, 1), list(toplist, 2)) = 1;
        imtemp(list(toplist, 1), list(toplist, 2)) = 1;        
    end
  
end
ret = im;

n = sum(ret); m = n>0; ret = ret(:,m);
ret = transpose(ret);
n = sum(ret); m = n>0; ret = ret(:,m);
ret = transpose(ret);

%figure;image_view(1-ret);
