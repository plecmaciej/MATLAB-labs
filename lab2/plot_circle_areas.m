function plot_circle_areas(circle_areas)
    % Wygenerowanie wykresu
    plot(circle_areas, '-o');
    
    % Dodanie tytułu i opisów osi
    title('Wykres sumy pól pierwszych i wylosowanych kół');
    xlabel('Numer kółka');
    ylabel('Suma pól kół (m^2)');
    
    % Ustawienie osi w skali liniowej
    set(gca,'xscale','linear');
    set(gca,'yscale','linear');
    print -dpng zadanie3.png 
end