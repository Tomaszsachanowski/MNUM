function [Q,R] = Decompose_QR(A)
    %rozk�ad QR (w�ski) zmodyfikowanym algorytmem Grama-Schmidta dla macierzy m x n (m>=n) o rz�dzie n, rzeczywistej lub zespolonej
    [m n] = size(A);
    Q=zeros(m,n);
    R=zeros(n,n);
    d=zeros(1,n);
    %rozk�ad z kolumnami Q ortogonalnymi
    for i=1:n
        Q(:,i) = A(:,i);
        R(i,i) = 1;
        d(i) = Q(:,i)'*Q(:,i);
        for j=i+1:n
            R(i,j)=(Q(:,i)'*A(:,j))/d(i);
            A(:,j)=A(:,j)-R(i,j)*Q(:,i);
        end
    end
    %normowanie rozk�adu (kolumny Q ortonormalne)
    for i=1:n
        dd=norm(Q(:,i));
        Q(:,i)=Q(:,i)/dd;
        R(i,i:n)=R(i,i:n)*dd;
    end
end