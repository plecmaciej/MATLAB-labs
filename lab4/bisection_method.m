function [xsolution,ysolution,iterations,xtab,xdif] = bisection_method(a,b,max_iterations,ytolerance,fun)
% a - lewa granica przedziału poszukiwań miejsca zerowego
% b - prawa granica przedziału poszukiwań miejsca zerowego
% max_iterations - maksymalna liczba iteracji działania metody bisekcji
% ytolerance - wartość abs(fun(xsolution)) powinna być mniejsza niż ytolerance
% fun - funkcja, której miejsce zerowe będzie wyznaczane
%
% xsolution - obliczone miejsce zerowe
% ysolution - wartość fun(xsolution)
% iterations - liczba iteracji wykonana w celu wyznaczenia xsolution
% xtab - wektor z kolejnymi kandydatami na miejsce zerowe, począwszy od xtab(1)= (a+b)/2
% xdiff - wektor wartości bezwzględnych z różnic pomiędzy i-tym oraz (i+1)-ym elementem wektora xtab; xdiff(1) = abs(xtab(2)-xtab(1));
xtab = [(a + b) / 2]; % Początkowa wartość xtab
xsolution = [];
ysolution = [];
iterations = 0;
xdif = [];
alrigh = true;
k = 0;
% Sprawdzenie warunku początkowego
fa = fun(a);
fb = fun(b);
if sign(fa) == sign(fb)
    error('Funkcja nie spełnia warunku początkowego (f(a) i f(b) mają takie same znaki).');
end

% Iteracje metody bisekcji
while k < max_iterations
    ftab = fun((a + b) / 2); % Obliczenie wartości funkcji w punkcie środkowym przed aktualizacją granic

    iterations = iterations + 1;
     % Dodanie nowej wartości xtab
    
    % Obliczenie różnicy między kolejnymi kandydatami na miejsce zerowe
    if length(xtab) > 1
        xdif = [xdif; abs(xtab(end) - xtab(end-1))];
    end
    
    % Sprawdzenie warunku zbieżności przed aktualizacją granic
    if abs(ftab) < ytolerance
        xsolution = xtab(end);
        ysolution = ftab;
        alrigh = false;
        break; % Przerwanie pętli, jeśli warunek zbieżności jest spełniony
    end
    
    if alrigh == false
        break;
    end
    
    if sign(ftab) == sign(fa)
        a = xtab(end); % Aktualizacja lewej granicy przedziału
    else
        b = xtab(end); % Aktualizacja prawej granicy przedziału
    end
    xtab = [xtab; (a + b) / 2];
    k = k + 1;
end

% Wartość rozwiązania
xsolution = xtab(end);
ysolution = fun(xsolution);
end
