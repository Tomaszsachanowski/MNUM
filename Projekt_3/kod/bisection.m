function [c, iter] = bisection(a, b, eps, iter_max)
    iter = 0; % ilosc iteracji
    c = (a + b)/2; % sordek przedzialu
    value_c = func(c); % wartosc dla srodka (rozwiazanie)
    tmp_a = a;
    tmp_b= b;
    while((abs(value_c) > eps)&& iter <= iter_max)
        % koniec gdy osiagniemy dobra dokladnosc albo ilosc iteracji
        value_a = func(tmp_a); % wartosci na koncach przedzialu
        value_b = func(tmp_b);
        %sprawdzamy obszar izolacji
        if(value_a*value_b>0)
            error('Brak obszaru izolacji');
        end
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

