function [c, iter] = bisection(a, b, eps)
    iter = 0; % ilosc iteracji
    c = (a + b)/2; % sordek przedzialu
    value_c = func(c); % wartosc dla srodka (rozwiazanie)
    tmp_a = a;
    tmp_b= b;
    while(abs(value_c) > eps) % koniec gdy osiagniemy dobra dokladnosc
        value_a = func(tmp_a); % wartosci na koncach przedzialu
        value_b = func(tmp_b);
        c = (tmp_a + tmp_b)/2; % nowy srodek przedzialu
        value_c = func(c);
        if (value_a*value_c < 0) % sprawdzenie zmiany znaku
           tmp_b = c;
        end
        if (value_b*value_c < 0)
           tmp_a = c;
        end
        iter = iter + 1;
    end
end

