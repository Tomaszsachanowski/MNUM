function [y, y_2] = wielomian(x)
% y wartosc wielomianu w punkcie x
% y_2 wartosc pochdnej wielomianu w punkcie x
    A = [2 5 -2 3 7];% wsp�czynniki wielomianu
    B = polyder(A); % wsp�czynniki pochodnej wielomianu
    y = polyval(A, x);
    y_2 = polyval(B, x);
end

