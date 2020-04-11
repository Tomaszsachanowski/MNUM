function [M] = Generate_asymetric_matrix(size)
% M- wyjsciowa macierz asymetryczna
    
    M = rand(size); % loswa macierz
    while issymmetric(M)
        M = rand(size); % loswa macierz
    end
    return;
end

