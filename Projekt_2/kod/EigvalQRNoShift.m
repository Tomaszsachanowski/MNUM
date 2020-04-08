function [eigenvalues, it, goodit] = EigvalQRNoShift(A, up0, maxit)
%%up0-górna granica elementów zerowanych
%%maxit-maksymalna liczba iteracji
    it=1; %%inicjalizacja iteratora
    goodit = 1; %%sprawdzenie czy liczba iteracji nie przekroczy³a maxit
    n=size(A,1); %%pobranie rozmiaru macierzy
    %%alokacja pamiêci dla macierzy diagonalnej
    eigenvalues = diag(zeros(n)); 
    % przechowuj¹cej wartoœci w³asne macierzy A
    Ak = A; %%alukujê pamiêæ w celu nie zmienienia macierzy A
    %%wykonuj a¿ do na-stêpuj¹cych warunków - liczba it przekroczy itmax lub
    while (it <= maxit && max(max(Ak-diag(diag(Ak)))) > up0) 
        [Q,R]=qrGS(Ak); %%rozk³ad QR metod¹ Grama-Schmidta
        %%zgodnie z metod¹ A w nastêpnej iteracji bêdzie obliczone w ten sposób
        Ak=R*Q; 
        it = it + 1; %%zwiêkszamy wartoœæ iteratora
    end
    if it>maxit
        %% jeœli nie uda³o siê osi¹gn¹æ wyniku w mniej ni¿ itmax ite-racji
        %% wtedy oznacza, ¿e siê nie uda³o obliczyæ wartoœci 
        %% w³asnej z dan¹ dok³adnoœci¹
        goodit = 0;  
    end
    eigenvalues = diag(Ak);
end