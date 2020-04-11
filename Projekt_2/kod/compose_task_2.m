function [norma] = compose_task_2()
    Xdane = [ -5; -4; -3; -2; -1; 0; 1; 2; 3; 4; 5];
    Ydane = [-23.4523; 11.9631; 4.4428; 1.1010; -1.6826; -1.2630; -0.0357; -1.3156; -3.4584; -8.4294; -18.4654];
    colors = ['y-','m--', 'c:', 'r-.'];
    norma = zeros(4,2);
    przedzial_x = -5:0.1:5;
    figure()
    title('Uklad rownan normalnych- Wielomian stopnia od 9 do 12');
    xlabel('X')
    ylabel('Y')
    hold on
    scatter(Xdane, Ydane)
    for stopien=9:12
        [a1, norma1, a2, norma2] = aproksymacja(Xdane,Ydane, stopien);
        norma(stopien-8, 1) = norma1;
        wsp1 = polyval(a1,przedzial_x);
        %wsp2 = polyval(a2,przedzial_x);
        plot(przedzial_x, wsp1,colors(stopien-8));
        %polyfit(Xdane,Ydane,stopien);

    end
    legend('dane pomiarowe (próbki)','funkcja wielomianowa st 9','funkcja wielomianowa st 10','funkcja wielomianowa st 11','funkcja wielomianowa st 12')
    hold off


    figure()
    title('Rozklad QR- Wielomian stopnia od 9 do 12');
    xlabel('X')
    ylabel('Y')
    hold on
    scatter(Xdane, Ydane)
    for stopien=9:12
        [a1, norma1, a2, norma2] = aproksymacja(Xdane,Ydane, stopien);
        %wsp1 = polyval(a1,przedzial_x);
        norma(stopien-8, 2) = norma2;
        wsp2 = polyval(a2,przedzial_x);
        plot(przedzial_x, wsp2,colors(stopien-8));
        %polyfit(Xdane,Ydane,stopien);

    end
    legend('dane pomiarowe (próbki)','funkcja wielomianowa st 9','funkcja wielomianowa st 10','funkcja wielomianowa st 11','funkcja wielomianowa st 12')
    hold off
end

