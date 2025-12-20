function [xsolution,ysolution,iterations,xtab,xdif] = secant_method(a,b,max_iterations,ytolerance,fun)
% a - lewa granica przedziału poszukiwań miejsca zerowego (x0=a)
% b - prawa granica przedziału poszukiwań miejsca zerowego (x1=b)
% max_iterations - maksymalna liczba iteracji działania metody siecznych
% ytolerance - wartość abs(fun(xsolution)) powinna być mniejsza niż ytolerance
% fun - funkcja, której miejsce zerowe będzie wyznaczane
%
% xsolution - obliczone miejsce zerowe
% ysolution - wartość fun(xsolution)
% iterations - liczba iteracji wykonana w celu wyznaczenia xsolution
% xtab - wektor z kolejnymi kandydatami na miejsce zerowe, począwszy od x2
% xdif - wektor wartości bezwzględnych z różnic pomiędzy i-tym oraz (i+1)-ym elementem wektora xtab; xdiff(1) = abs(xtab(2)-xtab(1));

% Inicjalizacja zmiennych
xsolution = [];
ysolution = [];
iterations = 1;
xtab = [];
xdif = [];

% Pierwsze przybliżenia
x0 = a;
x1 = b;
f0 = fun(x0);
f1 = fun(x1);

% Iteracje metody siecznych
while iterations < max_iterations
    % Obliczenie kolejnej aproksymacji miejsca zerowego
    x2 = x1 - f1 * (x1 - x0) / (f1 - f0);
    
    % Obliczenie wartości funkcji w punkcie x2
    f2 = fun(x2);
    
    % Aktualizacja zmiennych
    x0 = x1;
    f0 = f1;
    x1 = x2;
    f1 = f2;
    
    % Zapisanie wartości x2 do wektora xtab
    xtab = [xtab; x2];
    
    % Zapisanie wartości bezwzględnej różnicy między kolejnymi kandydatami na miejsce zerowe do wektora xdif
    if length(xtab) > 1
        xdif = [xdif; abs(xtab(end) - xtab(end-1))];
    end
    
    % Sprawdzenie warunku zbieżności
    if abs(f2) < ytolerance
        xsolution = x2;
        ysolution = f2;
        break;
    end
    
    % Inkrementacja liczby iteracji
    iterations = iterations + 1;
end
end
