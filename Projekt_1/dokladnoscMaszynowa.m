% g - najmniejsza dodatnia liczba maszynowa, która spełnia warunkek fl(1+g)>1
function [g] = dokladnoscMaszynowa()
% tmp - zmienna pomocnicza
tmp = 1;
iter = 0;
while (tmp+1>1)
iter = iter + 1;
g = tmp;
tmp = tmp/2;
end
disp(iter-1);
end