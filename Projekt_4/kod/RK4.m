function [] = RK4(x1, x2, h)
    it = 1;
    tic;
    for i = 0:h:20
        % wpisujemy do macierzy wynik�w
        results(it,1) = x1;
        results(it,2) = x2;
        it = it + 1;
        % obliczenie wsp�czynnik�w k
        [k11,k12] = func(x1,x2);
        [k21,k22] = func(x1 + 1/2 * h * k11, x2 + 1/2 * h * k12);
        [k31,k32] = func(x1 + 1/2 * h * k21, x2 + 1/2 * h * k22);
        [k41,k42] = func(x1 + h * k31, x2 + h * k32);
        x1 = x1 + (1/6) * h * (k11 + 2 * k21 + 2 * k31 + k41);
        x2 = x2 + (1/6) * h * (k12 + 2 * k22 + 2 * k32 + k42);
    end
    results(it,1) = x1;
    results(it,2) = x2;
    it = it - 1;
    t = toc;
    % por�wnanie z funkcj� ode45 programu Matlab
    [~,y] = ode45(@odefun, [0 20], [results(1,1) results(1,2)]);
    plot(results(:,1), results(:,2));
    hold on;
    plot(y(:,1),y(:,2));
    legend('RK4', 'ode45');
    hold off;
    plotTitle = sprintf('RK4, krok h = %f, liczba iteracji = %d, czas wykonania: %f s \n', h, it, t);
    title(plotTitle);
end

