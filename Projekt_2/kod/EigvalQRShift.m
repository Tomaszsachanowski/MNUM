function [ eigenvalues, iteracje,success] = EigvalQRShift( A, tol, imax )
    %Oblicznie wartosci wlasnych metoda rozkladu QR z przesunieciami
    % tol - tolerancja
    % imax - maksymalna liczba iteracji
    success = 1;
    n=size(A,1);
    eigenvalues = diag(zeros(n));
    INITIALsubmatrix = A; %macierz pocz¹tkowa (oryginalna)
    iteracje = 0;
    for k = n:-1:2
        DK = INITIALsubmatrix; %macierz startowa dla jednej wart. w³asnej
        i = 0;
        while i<= imax && max(abs(DK(k,1:k-1)))>tol
            DD = DK(k-1:k,k-1:k); %macierz 2x2 prawego dolnego rogu 
            e=[1,-(DD(1,1)+DD(2,2)),DD(2,2)*DD(1,1)-DD(1,2)*DD(2,1)];
            r=roots(e); %%obliczamy pierwiastki wielomianu e
            if abs(r(1,1)-DD(2,2)) < abs(r(2,1)-DD(2,2)) %%wartoœæ w³asna
                shift = r(1,1);
            else
                shift = r(2,1);
            end
            DK = DK - eye(k)*shift; %macierz przesuniêta
            [Q1,R1] = Decompose_QR(DK); %faktoryzajca QR
            DK = R1 *Q1 +eye(k)*shift; %macierz przekszta³cona
            i = i+1;
            iteracje = iteracje + 1;
        end
        if i >imax
            success = 0;
            disp('imax exceeded program terminated')
        end
        eigenvalues(k) = DK(k,k);
        if k>2
            INITIALsubmatrix = DK(1:k-1,1:k-1); %deflacja macierzy
        else
            eigenvalues(1) = DK(1,1); %ostatnia wartoœæ w³asna
        end
    end
end