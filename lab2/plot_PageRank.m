function plot_PageRank(r)
    % Generowanie wykresu słupkowego
    bar(r);
    
    % Dodanie tytułu i opisów osi
    title('Ranking stron w rozpatrywanej sieci');
    xlabel('Strony');
    ylabel('Ranking');
    
    % Zapisanie wykresu do pliku
    print('zadanie7.png', '-dpng');
end