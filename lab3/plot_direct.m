function plot_direct(N, vtime_direct)
    % N - wektor zawierający rozmiary macierzy dla których zmierzono czas obliczeń metody bezpośredniej
    % vtime_direct - czas obliczeń metody bezpośredniej dla kolejnych wartości N

    figure;
    plot(N, vtime_direct);
    xlabel('Rozmiar macierzy');
    ylabel('Czas [s]');
    title('Zależność czasu wyznaczenia rozwiązania od rozmiaru macierzy (metoda bezpośrednia)');
    grid on;
end