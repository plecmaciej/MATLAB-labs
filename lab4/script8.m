% Granice poszukiwań miejsca zerowego
a = 1;
b = 60000;

% Tolerancja i maksymalna liczba iteracji
ytolerance = 1e-12;
max_iterations = 100;

% Wywołanie funkcji bisection_method
[n_bisection, ~, ~, xtab_bisection, xdif_bisection] = bisection_method(a, b, max_iterations, ytolerance, @estimate_execution_time);

% Wywołanie funkcji secant_method
[n_secant, ~, ~, xtab_secant, xdif_secant] = secant_method(a, b, max_iterations, ytolerance, @estimate_execution_time);

% Wykresy
figure;

% Górny wykres
subplot(2,1,1);
plot(xtab_bisection, 'b-', 'DisplayName', 'Bisection');
hold on;
plot(xtab_secant, 'r--', 'DisplayName', 'Secant');
xlabel('Iteracja');
ylabel('N');
title('Przybliżenie rozwiązania w kolejnych iteracjach');
legend('Location', 'best');

% Dolny wykres
subplot(2,1,2);
semilogy(xdif_bisection, 'b-', 'DisplayName', 'Bisection');
hold on;
semilogy(xdif_secant, 'r--', 'DisplayName', 'Secant');
xlabel('Iteracja');
ylabel('Różnica');
title('Różnice pomiędzy przybliżeniami rozwiązania w kolejnych iteracjach');
legend('Location', 'best');
saveas(gcf, 'zdjecie8.png');
% Wyniki
n_bisection % Liczba parametrów N dla metody bisekcji
n_secant    % Liczba parametrów N dla metody siecznyc
