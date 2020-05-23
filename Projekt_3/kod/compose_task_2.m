function [i] = compose_task_2()
    format long;
%     result = zeros(9,10);
%     eps = 0.001;
%     iter_max = 100;

% %     A = [2 5 -2 3 7];% wspó³czynniki wielomianu
% %     disp(roots(A));
% %     X = -3:0.01:2; % Nasza dziedzina
% %     %Y = arrayfun(@(x) wielomian(x), X);
% %     figure;
% %     plot(X,polyval(A,X));
% %     line([-3,2],[0,0],'Color','b');
% %     title("wielomian 2x^4+5x^3-2x^2+3x+7");
      for i=-60:60
                x3 = mm2(i, 30);
                if abs(x3 - (0.65399 - 0.9398i)) < 0.0002
                    disp (i);
                    return;
                end
      end
%     line([2,11],[0,0],'Color','b')
%     for i=1:10
%         [x0, iter] = bisection(3, 7, eps, iter_max);
%         results(1, i) = eps;
%         results(2, i) = x0;
%         results(3, i) = iter;
%         [x0, iter] = bisection(7, 7.5, eps, iter_max);
%         results(4, i) = x0;
%         results(5, i) = iter;
%         [x0, iter] = secant(3, 7, eps, iter_max);
%         results(6, i) = x0;
%         results(7, i) = iter;
%         [x0, iter] = secant(7, 7.5, eps, iter_max);
%         results(8, i) = x0;
%         results(9, i) = iter;
%         eps = eps/10;
%     end
end

