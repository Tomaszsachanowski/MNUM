function [x, err] = jacobi(M,b, max_iteration, max_error)
% A - macierz uk³adu równañ
% b - wektor wyników
% max_iteration - ilosc iteracji
% max_errror - blad jaki jest juz akceptowalny

% x - wektor argumentów
% err - blad otrzymanego wyniku
    D_diagonal = zeros(size(M));
    x = zeros(size(M,1),1);
    L_U = M;

    % utworzenie macierzy diagonalnej poddiagonalnej+naddiagonalnej
    for i=1:size(M,1)
        D_diagonal(i, i) = M(i, i);
        L_U(i, i) = 0;
    end
    %ustawienie flag dominacji
    dom_row = true;
    dom_col = true;
    % sprawdzenie czy dominacja wystepuje
    for i=1:size(M, 1)
        tmp_row = abs(M(i,:));
        tmp_col = abs(M(:,i));
        sum_row = sum(tmp_row) - abs(M(i,i));
        sum_col = sum(tmp_col) - abs(M(i,i));
        
        if sum_row > abs(D_diagonal(i,i))
            dom_row = false;
        end
        if sum_col > abs(D_diagonal(i,i))
            dom_col = false;
        end
    end
    %zakoñczenie jeœli metoda siê nie powiedzie
    if ~(dom_col || dom_row)
        fprintf("Macierz nie ma dominacji diagonalnej wierszowej ani kolumnowej\n");
        %return;
    end
    
    err = inf;
    iter = 0;
    %temp_x tymczasowy wektor argumentow
    temp_x = zeros(size(x));
    
    while err > max_error
           iter = iter + 1;
           % kolejna wartosc argumentow x(i+1)
           temp_x(:,1) = (-inv(D_diagonal)*L_U)*x(:,1) + inv(D_diagonal)*b;
           x(:,1) = temp_x(:,1);
           % 0bliczenie bledu
           err = sum(abs(M*x - b));
           if iter > max_iteration
              fprintf("Koniec iteracji, error wynosi: %d\n",err);
              return;
           end
    end
    fprintf("Zakonczono po: %d Error=%d\n", iter, err);
end

