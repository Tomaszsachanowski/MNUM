function [results] = compose_task_1()
    format long;
    results = zeros(9,10);
    eps = 0.001;
    iter_max = 100;
    X = 2:0.1:11; % Nasza dziedzina
    Y = arrayfun(@(x) func(x),X);
    figure;
    plot(X,Y);
    line([2,11],[0,0],'Color','b')
    for i=1:10
        [x0, iter] = bisection(3, 7, eps, iter_max);
        results(1, i) = eps;
        results(2, i) = x0;
        results(3, i) = iter;
        [x0, iter] = bisection(7, 7.5, eps, iter_max);
        results(4, i) = x0;
        results(5, i) = iter;
        [x0, iter] = secant(3, 7, eps, iter_max);
        results(6, i) = x0;
        results(7, i) = iter;
        [x0, iter] = secant(7, 7.5, eps, iter_max);
        results(8, i) = x0;
        results(9, i) = iter;
        eps = eps/10;
    end
end

