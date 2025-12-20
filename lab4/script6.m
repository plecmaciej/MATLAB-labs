% Parametry metody
a = 1;
b = 50;
ytolerance = 1e-12;
max_iterations = 100;

% Wywołanie funkcji bisection_method
[time_bisection, velocity_bisection, ~, ttab_bisection, tdif_bisection] = bisection_method(a, b, max_iterations, ytolerance, @rocket_velocity);

% Wywołanie funkcji secant_method
[time_secant, velocity_secant, ~, ttab_secant, tdif_secant] = secant_method(a, b, max_iterations, ytolerance, @rocket_velocity);

% Wykresy
figure;

% Górny wykres
subplot(2,1,1);
plot(ttab_bisection, 'b-', 'DisplayName', 'Bisection');
hold on;
plot(ttab_secant, 'r--', 'DisplayName', 'Secant');
xlabel('Iteracja');
ylabel('Czas (t)');
title('Przybliżenie rozwiązania w kolejnych iteracjach');
legend('Location', 'best');

% Dolny wykres
subplot(2,1,2);
semilogy(tdif_bisection, 'b-', 'DisplayName', 'Bisection');
hold on;
semilogy(tdif_secant, 'r--', 'DisplayName', 'Secant');
xlabel('Iteracja');
ylabel('Różnica');
title('Różnice pomiędzy przybliżeniami rozwiązania w kolejnych iteracjach');
legend('Location', 'best');
saveas(gcf, 'zdjecie6.png');
% Wyniki
time_bisection
time_secant