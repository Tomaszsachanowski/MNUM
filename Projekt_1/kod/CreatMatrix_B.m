function [A,b] = CreatMatrix_B(size)
A = zeros(size);
b = zeros(size, 1);

for i = 1: size
    b(i,1) = 4 + 0.4*i;
    for j = 1: size
        if(i==j)
            A(i,j) = 1/3;
        else
            A(i,j) = 3*(i-j) + 2;
        end
    end
end
end

