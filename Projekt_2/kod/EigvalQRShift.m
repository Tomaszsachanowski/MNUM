function [eigenvalues, it, goodit] = EigvalQRShift(A, up0, maxit)
    %%up0-g�rna granica element�w zerowanych
    %%maxit-maksymalna liczba iteracji
    n=size(A,1); %%pobieramy rozmiar macierzy
    %%alokacja pami�ci dla macierzy diagonalnej
    %%przechowuj�cej warto�ci w�asne macierzy A
    eigenvalues=diag(zeros(n)); 
    Ak = A; %%macierz pocz�tkowa (oryginalna)
    it=0; %%iterator
    %%jesli zosta� przekroczony maxit w�wczas
    %%uznajemy �e algorytm nie da� rady
    goodit=1; 
    for k=n:-1:2
        DK=Ak; %%DK - macierz startowa dla jednej warto�ci w�asnej
        it=0;
        while (it <= maxit && max(abs(DK(k,1:k-1))) > up0)
        %%wykonuj a� do nast�puj�cych warunk�w - liczba
        %%it przekroczy itmax lub
            DD=DK(k-1:k,k-1:k); %%podmacierz dolnego prawego rogu
            e=[1,-(DD(1,1)+DD(2,2)),DD(2,2)*DD(1,1)-DD(1,2)*DD(2,1)];
            r=roots(e); %%obliczamy pierwiastki wielomianu e
            %%warto�� w�asna podmacierzy DD
            if abs(r(1,1)-DD(2,2)) < abs(r(2,1)-DD(2,2)) 
                shift=r(1,1);
            else
                shift=r(2,1);
            end
            DK=DK-eye(k)*shift; %%macierz przesuni�ta
            [Q,R]=Decompose_QR(DK); %%faktoryzacja QR
            DK=R*Q+eye(k)*shift; %%dodajemy przesuni�cia
            it=it+1; %%zwi�kszamy iterator
        end
        if it > maxit
            %%je�li nie uda�o si� osi�gn�� wyniku w mniej ni� itmax
            %%iteracji wtedy oznacza, �e si� nie uda�o obliczy�
            %%warto�ci w�asnej z dan� dok�adno�ci�
            goodit = 0; 
        end
        %%zapisujemy jako warto�� w�asna element z rogu macierzy
        eigenvalues(k)=DK(k,k);
        if k>2
            Ak=DK(1:k-1,1:k-1); %%macierz - deflacja
        else
            eigenvalues(1)=DK(1,1); %%je�eli to ostatnia macierz w�asna
        end
    end
end