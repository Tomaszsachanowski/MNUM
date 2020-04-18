function [ x3, iter, iter_results] = mm1( x0, x1, x2, iter_max)
    iter = 0;
    iter_results = zeros(iter_max, 2);
    %while abs(y) > eps && iter <= iter_max
    for i = 1:iter_max
        % zmienne przyrostowe
        z0 = x0 - x2;
        z1 = x1 - x2;
        [c, ~]= wielomian(x2);
        %tworzymy uk³ad równañ do obliczenia a,b i rozwi¹zujemy go
        A = [z0^2 , z0; z1^2, z1];
        [f2_x0, ~] = wielomian(x0);
        [f2_x1, ~] = wielomian(x1);
        B = [f2_x0 - c; f2_x1 - c];
        [w] = linsolve(A,B);
        a = w(1);
        b = w(2);
        %wybieramy zmin jako ten o najmniejszym module
        if(abs(b + sqrt(b^2 - 4*a*c)) >= abs(b - sqrt(b^2 - 4*a*c)))
            zmin = (-2*c)/(b + sqrt(b^2 - 4*a*c));
        else
            zmin = (-2*c)/(b - sqrt(b^2 - 4*a*c));
        end
        %obliczamy kolejne przybli¿enie miejsca zerowego
        x3 = x2 + zmin;
        x(i) = x3;
        y(i) = f2(x3);
        % polozenei punktow
        d0 = abs(x3-x0);
        d1 = abs(x3-x1);
        d2 = abs(x3-x2);
        %Odrzucamy spoœród x0,x1,x3 to przybli¿enie które jest najbardziej
        %oddalone of x3
        if(d1 < d0)
            u = x1;
            x1 = x0;
            x0 = u;
        end
        if(d2<d1)
            u = x2;
            x2 = x1;
            x1 = u;
        end
        %Przygotowujemy siê do kolejnej iteracji
        x2 = x3;
    end
x=x';
y=y';
end