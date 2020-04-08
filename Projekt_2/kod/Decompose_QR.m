function [Q,R] = Decompose_QR(A)
    n = size(A,1);
    Q = zeros(n);
    R = zeros(n);
    d = zeros(1, n);
    %rozk³ad z kolumnami Q ortogonalnymi
        for i=1:n
            Q(:,i) = A(:,i);
            R(i,i) = 1;
            d(i) = Q(:,i)'*Q(:,i);
            for j=i+1:n
                R(i,j)=(Q(:,i)'*A(:,j))/d(i);
                A(:,j)=A(:,j)-R(i,j)*Q(:,i);
            end
        end
    %normowanie rozk³adu (kolumny Q ortonormalne)
    for i=1:n
        dd=norm(Q(:,i));
        Q(:,i)=Q(:,i)/dd;
        R(i,i:n)=R(i,i:n)*dd;
    end
end

