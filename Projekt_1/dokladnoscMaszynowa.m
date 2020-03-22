% g - najmniejsza dodatnia liczba maszynowa, która spełnia warunkek fl(1+g)>1
function [g] = dokladnoscMaszynowa()
% tmp - zmienna pomocnicza
tmp = 1;
while (tmp+1>1)
g = tmp;
tmp = tmp/2;
end
end