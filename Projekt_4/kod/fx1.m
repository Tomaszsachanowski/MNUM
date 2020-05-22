function [y1,y2] = fx1(x1,x2)
%FX1 Summary of this function goes here
%   Detailed explanation goes here
y1 = x2 + x1*(0.9 - x1^2 - x2^2);
y2 = -x1 + x2*(0.9 - x1^2 - x2^2);
end

