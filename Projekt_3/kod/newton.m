function [iter_results] = newton(x0,iter_max)%(x0, eps, iter_max)
    iter = 0; % ilosc iteracji
    % mamy tu tylko dwa pierwiastki
    % y to wartosc wielomianu w punkcie x0
    % y_2 to wartosc pochodnej wielomianu w punkcjie x0
    [y, y_2] = wielomian(x0);
    % zapiansie naszych wynikow w danej iteracji
    iter_results = zeros(iter_max, 2);
    for i=0:iter_max
    %while abs(y) > eps && iter <= iter_max
        x0 = x0 - y/y_2;
        [y, y_2] = wielomian(x0);
        iter = iter + 1;
        iter_results(iter, 1) = x0;
        iter_results(iter, 2) = y;   
    end
end

