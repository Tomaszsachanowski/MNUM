function [dydt] = odefun(t, x)
    dydt = [x(2)+x(1)*(0.9-x(1)^2-x(2)^2) ;-x(1)+x(2)*(0.9-x(1)^2-x(2)^2)];

end

