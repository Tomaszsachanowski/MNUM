function [c, iter] = secant(a, b, eps, iter_max)
    iter = 0; % ilosc iteracji
    c = (a + b)/2; % sordek przedzialu
    value_c = func(c); % wartosc dla srodka (rozwiazanie)
    tmp_a = a;
    tmp_b= b;
    value_a = func(tmp_a); % wartosci na koncach przedzialu
    value_b = func(tmp_b);
    %sprawdzamy obszar izolacji
    if(value_a*value_b>0)
        error('Brak obszaru izolacji');
    end
    while((abs(value_c) > eps)&& iter <= iter_max)
        % koniec gdy osiagniemy dobra dokladnosc albo limit iteracji
        value_a = func(tmp_a); % wartosci na koncach przedzialu
        value_b = func(tmp_b);
        c = (tmp_a*value_b - tmp_b*value_a)/(value_b - value_a); % nowa wartosc
        % dla metody siecznych
        value_c = func(c); % wartosc dla siecnych (rozwiazanie)
        tmp_a = b;
        tmp_b = c;
        iter = iter + 1;
    end
    if iter > iter_max
        disp("Przekorczono limit iteracji");
    end
end

