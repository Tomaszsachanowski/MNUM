function [r] = gauss(M, b)
%b- wektor wynikow
%M- macierz wspolczynikow
%r- norma residuum

%Sprawdzenie czy uklad rownan ma rozw. (Tw. CRAMERA)
    if (det(M) == 0)
        text = "Wyznacznik macierzy jest rowny zero(bliski) ";
        text = text + "Nie ma pojedynczego rozw";
        fprintf(text);
        return;
    end
    fprintf('Wskanik uwarunkowania zadania %d\n',cond(M));
    %laczenie M i b
    A = [M,b];
    % ilosc rownan
    size_n = max(size(M));
    % iteracja po kolumnach, -1 bo jest dolaczony wektor odpowiedzi b.
    % Trzeba skonczyc operacje na przedostatniej kolumnie macierzy M a
    % po dolaczeniu A jest dluzszy o jedna kolumne
    for c=1:size_n - 1
        % ustawienie pomocniczej wartosci dla elementu
        % glownego w danym wierszu.
        tmp_max_elemnet = A(c, c);
        index_max = c;
        %szukanie elementu glownego w danym wierszu
        for r=c:size_n
            if (tmp_max_elemnet < A(r,c))
                tmp_max_elemnet = A(r,c);
                index_max = r;
            end
        end
        % zamiana wierszy aby ten z elementem glownym byl
        % uzyty do wyliczenia wspolczynikow
        if (index_max ~= c)
            tmp_row = A(index_max, 1:(size_n+1));
            A(index_max,1:(size_n+1)) = A(c,1:(size_n+1));
            A(c,1:(size_n+1)) = tmp_row; 
        end
        %wyznaczenie wspolczynnikow. 
        for r=(c+1):size_n
            A(r,c) = A(r,c)/A(c,c);
        end
        %zmiana wartoci macierzy
        % kozystajac z znanego wspolczynika dla danego wiersza.
        for c2=(c+1):(size_n+1)
            for r=(c+1):size_n
                A(r,c2)=A(r,c2)- A(r,c)*A(c,c2);
            end
        end
    end

    %macierz trojkatna i b(odpowiedzi dla macierzy trojkatnej)
    % sa wyliczone teraz operacja odwrotna
    %results_x- wektor ktory przechowyje rozwiazanie 
    results_x = zeros(size_n,1); % utworzenie na wartosc zerowa
    % obliczenie ostatneij pozycji bo jest wolna.
    results_x(size_n) = A(size_n,size_n+1)/A(size_n,size_n);
    % zaczynamy wyliczaæ od przedodstatniego wiersza
    % ostatni wiersz zotal wyzej wyliczony
    r = size_n-1;
    % petla po wierszach od konca
    while(r > 0)
        % sum- zmienna pomocnicza do wyliczneia wartosic
        % zmiennych x znanych w danym wierszu.
        sum = 0;
        for c=r+1:size_n
           % w danym wierszu r znam wartosci x(r+1) i wiedzac jakie
           % maja wspolczyniki z macierzy obliczam ich wplyw
           sum = sum + results_x(c)*A(r,c);
        end
        % majac juz znane sum i kozystajac z wartoci dla wszystkch
        % wspolczynikiow moge obliczyc wartosc nieznaego x.
        results_x(r) = ( A(r,size_n+1)-sum)/A(r,r);
        r= r-1;
    end
    
    %obliczenie bledu rozw (% norma residuum)
    r = M*results_x - b;
    r = norm(r);
end