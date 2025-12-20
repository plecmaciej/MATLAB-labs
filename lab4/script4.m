% Parametry metody
a = 1;
b = 50;
ytolerance = 1e-12;
max_iterations = 100;

% Wywołanie funkcji bisection_method
[xsolution_bisection, ~, ~, xtab_bisection, xdif_bisection] = bisection_method(a, b, max_iterations, ytolerance, @impedance_magnitude);

% Wywołanie funkcji secant_method
[xsolution_secant, ~, ~, xtab_secant, xdif_secant] = secant_method(a, b, max_iterations, ytolerance, @impedance_magnitude);

% Wykresy
figure;

% Górny wykres
subplot(2,1,1);
plot(xtab_bisection, 'b-', 'DisplayName', 'Bisection');
hold on;
plot(xtab_secant, 'r--', 'DisplayName', 'Secant');
xlabel('Iteracja');
ylabel('Omega');
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
saveas(gcf, 'zdjecie4.png');
% Wyniki
omega_bisection = xsolution_bisection;
omega_secant = xsolution_secant;