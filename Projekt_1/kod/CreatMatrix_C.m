function [A,b] = CreatMatrix_C(size)
A = zeros(size);
b = zeros(size, 1);

for i = 1: size
    b(i, 1) = 1/(3*i);
    if mod(i, 2)== 1
        b(i, 1) = 0;
    end
    for j = 1: size
        A(i,j) = 6/(7*(i+j+1));
    end
end
end

