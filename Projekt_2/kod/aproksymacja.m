function [a1, norma1, a2, norma2]=aproksymacja(X,Y,stopien)
    rozmiar = size(X, 1); %macierz A
    A = zeros(rozmiar, stopien+1);
    %Wypelniamy macierz A potegami elementow x %
    for i=1:rozmiar
        for j=0:stopien
            A(i,stopien + 1 - j) = X(i)^(j);
        end
    end
    %uk³ad równañ normalnych
    a1 = A'*A\A'*Y;
    approximation1 = polyval(a1,X);
    %uk³ad równañ liniowych z macierz¹ R wynikaj¹c¹ z rozk³adu QR
    [Q, R] = Decompose_QR(A);
    a2 = R\(Q'*Y);
    approximation2 = polyval(a2,X);
    % Wyliczanie normy euklidesowej
    norma1 = norm(approximation1-Y);
    norma2 = norm(approximation2-Y);
end