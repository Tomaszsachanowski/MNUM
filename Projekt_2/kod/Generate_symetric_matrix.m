function [M] = Generate_symetric_matrix(size)
% M- wyjsciowa macierz symetryczna
    A = rand(size); % loswa macierz
    M = A + transpose(A); % utworzenie macierzy symetrycznej
    return;
end

