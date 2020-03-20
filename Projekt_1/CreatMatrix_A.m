function [A,b] = CreatMatrix_A(size)
A = zeros(size);
b = zeros(size, 1);

for i = 1: size
    b(i,1) = 4 + 0.3*i;
    for j = 1: size
        if(i==j)
            A(i,j) = 8;
        elseif(i == j - 1 || i == j + 1)
            A(i,j) = 4;
        end
    end
end
end

