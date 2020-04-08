function [eigenvalues, it, goodit] = EigvalQRNoShift(A, up0, maxit)
%%up0-g�rna granica element�w zerowanych
%%maxit-maksymalna liczba iteracji
    it=1; %%inicjalizacja iteratora
    goodit = 1; %%sprawdzenie czy liczba iteracji nie przekroczy�a maxit
    n=size(A,1); %%pobranie rozmiaru macierzy
    %%alokacja pami�ci dla macierzy diagonalnej
    eigenvalues = diag(zeros(n)); 
    % przechowuj�cej warto�ci w�asne macierzy A
    Ak = A; %%alukuj� pami�� w celu nie zmienienia macierzy A
    %%wykonuj a� do na-st�puj�cych warunk�w - liczba it przekroczy itmax lub
    while (it <= maxit && max(max(Ak-diag(diag(Ak)))) > up0) 
        [Q,R]=qrGS(Ak); %%rozk�ad QR metod� Grama-Schmidta
        %%zgodnie z metod� A w nast�pnej iteracji b�dzie obliczone w ten spos�b
        Ak=R*Q; 
        it = it + 1; %%zwi�kszamy warto�� iteratora
    end
    if it>maxit
        %% je�li nie uda�o si� osi�gn�� wyniku w mniej ni� itmax ite-racji
        %% wtedy oznacza, �e si� nie uda�o obliczy� warto�ci 
        %% w�asnej z dan� dok�adno�ci�
        goodit = 0;  
    end
    eigenvalues = diag(Ak);
end