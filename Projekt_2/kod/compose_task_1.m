function [itterations, successes, errors, srednie] = compose_task_1()
    sizes = [5 10 20];
    maxit = 1000;
    up0 = 0.0001;
    % wektory do przechowywania statystyk
    itterations = zeros(9, 1);
    successes = zeros(9, 1);
    errors = zeros(9, 1);
    srednie = zeros(9, 3);

    for i=1:3
        %%petla dla macierzy symetrycznej i algorytmu bez przesuniecia.
        for j=1:30
            Sym = Generate_symetric_matrix(sizes(i));
            [eigValues, iteration, succes] = EigvalQRNoShift(Sym, up0, maxit);
            if succes
               %zliczam liczbe udanych prob dla pierwszej kombiancji
               successes(i, 1) = successes(i, 1) + 1;
               itterations(i, 1) = itterations(i, 1) + iteration;
               %norma r�nicy
               errors(i,1) = errors(i,1) + norm(sort(eigValues) - sort(eig(Sym)));
            end
        end
        %%petla dla macierzy symetrycznej i algorymtu z przeunieciem.
        for j=1:30
            Sym = Generate_symetric_matrix(sizes(i));
            [eigValues, iteration, succes] = EigvalQRShift(Sym, up0, maxit);
            if succes
               %zliczam liczbe udanych prob dla drugiej kombiancji
               successes(i+3, 1) = successes(i+3, 1) + 1;
               itterations(i+3, 1) = itterations(i+3, 1) + iteration;
               %norma r�nicy
               errors(i+3,1) = errors(i+3,1) + norm(sort(eigValues) - sort(eig(Sym)));
            end
        end
%         %%petla dla macierzy asymetrycznej i algorymtu z przeunieciem.
        for j=1:30
            Asym = Generate_asymetric_matrix(sizes(i));
            [eigValues, iteration, succes] = EigvalQRShift(Asym, up0, maxit);
            if succes
               %zliczam liczbe udanych prob dla drugiej kombiancji
               successes(i+6, 1) = successes(i+6, 1) + 1;
               itterations(i+6, 1) = itterations(i+6, 1) + iteration;
               %norma r�nicy
               errors(i+6,1) = errors(i+6,1) + norm(sort(eigValues) - sort(eig(Asym)));
            end
        end
    end
    srednie(:,1)= itterations./successes;
    srednie(:,2) = successes./30;
    srednie(:,3) = errors./successes;
end

