function [] = wykres_jacobi()
    iteration = 30;
    max_err = 0.1e-10;
    results_err = zeros(iteration,1);
    iteration_number = zeros(iteration,1);
    %A = [17 2 11 -3; 4 -12 2 -3; 2 -2 8 -1; 5 -2 1 -9];
    %b = [12; 7; 0; 12];
    size = 10;
    [A, b] = CreatMatrix_A(size);
    for i=1:iteration
        fprintf("Iteracja %d\n",i);
        [x,err] = jacobi(A,b,i,max_err);
        results_err(i) = err;
        iteration_number(i) = i;
    end
    disp(x);
    figure()
    plot(iteration_number, results_err);
    title('Zaleznosc bledu od ilosci iteracji dane:A n=10')
    xlabel('ilosc iteracji') 
    ylabel('Error')
end

