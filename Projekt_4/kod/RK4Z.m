function [w,it] = RK4Z(x1,x2,h)
    it = 1; s = 0.9; % wspó³czynnik bezpieczeñstwa
    ew = 10^(-8); % dok³adnoœæ wzglêdna
    eb = 10^(-8); % dok³adnoœæ bezwzglêdna
    beta = 5; %maksymalna zmiana kroku w jednej iteracji
    hMin = 10^(-12);
    i=0;
    tic;
    while(true)
        w(it,1) = x1;
        w(it,2) = x2;
        w(it,3) = h;
        w(it,6) = i;
        [k11,k12] = func(x1,x2);
        [k21,k22] = func(x1 + 1/2 * h * k11, x2 + 1/2 * h * k12);
        [k31,k32] = func(x1 + 1/2 * h * k21, x2 + 1/2 * h * k22);
        [k41,k42] = func(x1 + h * k31, x2 + h * k32);
        x1e = x1;
        x2e = x2;
        h=h/2;
        for j=1:2
            [k11e,k12e] = func(x1e,x2e);
            [k21e,k22e] = func(x1e + 1/2 * h * k11e, x2e + 1/2 * h * k12e);
            [k31e,k32e] = func(x1e + 1/2 * h * k21e, x2e + 1/2 * h * k22e);
            [k41e,k42e] = func(x1e + h * k31e, x2e + h * k32e);
            x1e = x1e + (1/6) * h * (k11e + 2 * k21e + 2 * k31e + k41e);
            x2e = x2e + (1/6) * h * (k12e + 2 * k22e + 2 * k32e + k42e);
        end
        h=h*2;
        x1 = x1 + (1/6) * h * (k11 + 2 * k21 + 2 * k31 + k41);
        x2 = x2 + (1/6) * h * (k12 + 2 * k22 + 2 * k32 + k42);
        % b³êdy aproksymacji
        d1 = (x1e-x1)/15;
        d2 = (x2e-x2)/15;
        w(it,4)=d1;
        w(it,5)=d2;
        e1 = abs(x1e) * ew + eb;
        e2 = abs(x2e) * ew + eb;
        alpha = min([((e1/abs(d1))^(1/5)),((e2/abs(d2))^(1/5))]); % 1/p+1 = 1/5
        hNext = s * alpha * h;
        x1 = x1e;
        x2 = x2e;
        if (s * alpha >= 1)
            if ( i + h >= 20 )
                break;
            else
                i = i + h;
                h = min([hNext, beta * h, 20 - i]);
            end
        else
            if (hNext < hMin)
                error('Nie mo¿na rozwi¹zaæ z zadan¹ dok³adnoœci¹');
            else
                h = hNext;
                x1 = w(it,1);
                x2 = w(it,2);
            end
        end
        it = it + 1;
    end
    it = it - 1;
    t = toc;
    [~,y ] = ode45(@odefun, [0 20], [w(1,1) w(1,2)]);
    plot(w(:,1), w(:,2));
    hold on;
    plot(y(:,1),y(:,2));
    legend('RK4', 'ode45');
    hold off;
    plotTitle = sprintf('RK4Z liczba iteracji = %d, czas wykonania: %f s \n', it, t);
    title(plotTitle);
end