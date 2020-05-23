function Adams(x1,x2,h)
    it = 1;
    tic;
    for i = 1:3
        % wpisujemy do macierzy wyników
        results(it,1) = x1;
        results(it,2) = x2;
        it = it + 1;
        % obliczenie wspó³czynników k
        [k11,k12] = func(x1,x2);
        [k21,k22] = func(x1 + 1/2 * h * k11, x2 + 1/2 * h * k12);
        [k31,k32] = func(x1 + 1/2 * h * k21, x2 + 1/2 * h * k22);
        [k41,k42] = func(x1 + h * k31, x2 + h * k32);
        x1 = x1 + (1/6) * h * (k11 + 2 * k21 + 2 * k31 + k41);
        x2 = x2 + (1/6) * h * (k12 + 2 * k22 + 2 * k32 + k42);
    end
    for i = 5:floor(20/h)
        results(it,1) = x1;
        results(it,2) = x2;
        x = [x1 x2]';
        sigma = ((55/24) * odefun(0,[x1 x2]) - (59/24) * odefun(0,[results(it-1,1) results(it-1,2)]) + (37/24) * odefun(0,[results(it-2,1) results(it-2,2)]) - (9/24) * odefun(0,[results(it-3,1) results(it-3,2)]));
        pe = x + h * sigma;
        sigma = ((9/24) * odefun(0,pe) + (19/24) * odefun(0,[x1,x2]) - (5/24) * odefun(0,[results(it-1,1) results(it-1,2)]) + (1/24) * odefun(0,[results(it-2,1) results(it-2,2)]));
        x = x + h * sigma;
        x1 = x(1);
        x2 = x(2);
        it = it+1;
    end
    results(it,1) = x1;
    results(it,2) = x2;
    it = it - 1;
    t = toc;
    % porównanie z funkcj¹ ode45 programu Matlab
    [~,y] = ode45(@odefun, [0 20], [results(1,1) results(1,2)]);
    plot(results(:,1), results(:,2));
    hold on;
    plot(y(:,1),y(:,2));
    legend('PKA', 'ode45');
    hold off;
    plotTitle = sprintf('PKA, krok h = %f, liczba itacji = %d, czas wykonania: %f s \n', h, it, t);
    title(plotTitle);
end