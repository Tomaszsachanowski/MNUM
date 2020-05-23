function [y1,y2] = func(x1,x2)
%Funkcje opisujace ruch pnktu
% y1 do pochodnej pierwszej
% y2 do drugiej pochodnej
y1 = x2 + x1*(0.9 - x1^2 - x2^2);
y2 = -x1 + x2*(0.9 - x1^2 - x2^2);
end

