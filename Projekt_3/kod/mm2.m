function [iter_results] = mm2(x,iter_max)
    iter = 0;% ilosc iteracji
    % zapiansie naszych wynikow w danej iteracji
    iter_results = zeros(iter_max, 2);
    for i = 1:iter_max
        [y, der1] = wielomian(x);
        % wspolcynik dla 2 pochodnej wielomianu 
        der2 = polyval([24 30 -4], x);
        %Wybiermay pierwiastek o mniejszym module
        z1 = -2*y/(der1+sqrt(der1^2-2*y*der2));
        z2 = -2*y/(der1-sqrt(der1^2-2*y*der2));
        if abs(z1) > abs(z2)
            z_min = z2;
        else
            z_min = z1;
        end
        %obliczmy kolejne przybli¿enie miejsca zerowego
        x = x + z_min;
        iter =iter + 1;
        %zapisujemy wyniki
        iter_results(iter, 1) = x;
        [iter_results(iter, 2), ~] = wielomian(x);
    end
end