function [results_time] = wykres_residuum_time()
    value = 10;
    iteration = 8;
    results_r = zeros(iteration,1);
    results_time = zeros(iteration,1);
    count_equations = zeros(iteration,1);

    for i=1:iteration
        fprintf("Iteracja %d\n",i);
        size = value*2^i;
        [A, b] = CreatMatrix_A(size);
        [r, time] = gauss(A,b);
        results_r(i) = r;
        results_time(i) = time;
        count_equations(i) = size;
    end
    figure()
    plot(count_equations, results_time);
    title('Zaleznosc czasu od ilosci rownan w ukladzie (typ C)')
    xlabel('ilosc rownan') 
    ylabel('Czas')
    figure()
    plot(count_equations, results_r);
    title('Zaleznosc normy residuum od ilosci rownan w ukladzie (typ C)')
    xlabel('ilosc rownan') 
    ylabel('norma residuum')
end

