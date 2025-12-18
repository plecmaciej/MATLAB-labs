function plot_problem_5(N, time_Jacobi, time_Gauss_Seidel, iterations_Jacobi, iterations_Gauss_Seidel)
    % Opis wektorów stanowiących parametry wejściowe:
    % N - rozmiary analizowanych macierzy
    % time_Jacobi - czasy wyznaczenia rozwiązania metodą Jacobiego
    % time_Gauss_Seidel - czasy wyznaczenia rozwiązania metodą Gaussa-Seidla
    % iterations_Jacobi - liczba iteracji wymagana do wyznaczenia rozwiązania metodą Jacobiego
    % iterations_Gauss_Seide - liczba iteracji wymagana do wyznaczenia rozwiązania metodą Gauss-Seidla

    % Pierwszy wykres: zależność czasu obliczeń od rozmiaru macierzy
    subplot(2,1,1);
    plot(N, time_Jacobi, '-o', N, time_Gauss_Seidel, '-o');
    title('Czas obliczeń dla metody Jacobiego i Gaussa-Seidla');
    xlabel('Rozmiar macierzy');
    ylabel('Czas [s]');
    legend('Jacobi', 'Gauss-Seidel', 'Location', 'eastoutside');

    % Drugi wykres: zależność liczby iteracji od rozmiaru macierzy
    subplot(2,1,2);
    bar(N, [iterations_Jacobi; iterations_Gauss_Seidel]', 'grouped');
    title('Liczba iteracji dla metody Jacobiego i Gaussa-Seidla');
    xlabel('Rozmiar macierzy');
    ylabel('Liczba iteracji');
    legend('Jacobi', 'Gauss-Seidel', 'Location', 'eastoutside');

    saveas(gcf, 'zadanie5.png');
end
