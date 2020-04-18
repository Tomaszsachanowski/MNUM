function [x0,iter, iter_results] = newton(x0, eps, iter_max)
    iter = 0; % ilosc iteracji
    % mamy dwa pierwiastki
    [y, y_2] = wielomian(x0);
    iter_results = zeros(iter_max, 2);
    % y to wartosc wielomianu w punkcie x0
    % y_2 to wartosc pochodnej wielomianu w punkcjie x0
    for i=0:iter_max
    %while abs(y) > eps && iter <= iter_max
        iter_results(i, 1) = x0;
        iter_results(i, 2) = y;
        x0 = x0 - y/y_2;
        [y, y_2] = wielomian(x0);
        iter = iter + 1;
        iter_results(i, 1) = x0;
        
    end
end

