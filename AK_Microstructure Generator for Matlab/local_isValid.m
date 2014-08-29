function  is_val  = local_isValid(x, y, x0, y0, a, b, theta,n, im, nx, ny, color)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
if (x>0) && (y>0) && (x <= nx) && (y <= ny) && (im(x, y) ~= color) &&...
   (abs((((x - x0)*cos(theta))-((y - y0)*sin(theta))) / a ))^n + (abs((((x -x0)*sin(theta))-((y - y0)*cos(theta))) / b ))^n <= 1 ;
  
is_val = 1;
else
    is_val = 0;  
 
end
    

%unction  is_val  = local_isValid(x, y, x0, y0, a, b, theta,n, im, nx, ny, color)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%if (x>0) && (y>0) && (x <= nx) && (y <= ny) && (im(x, y) ~= color) &&...
%   (abs((((x - x0)*cos(theta))-((y - y0)*sin(theta))) / a ))^n + (abs((((x -
%    x0)*sin(theta))-((y - y0)*cos(theta))) / b ))^n <= 1 ;
  
%is_val = 1;
%else
%    is_val = 0;  
 
%end
    