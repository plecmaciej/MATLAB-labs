function plot_circles(a, circles, index_number)
    % Ustawienie właściwości osi
    axis equal; % Wyrównanie skali osi x i y
    axis([0 a 0 a]); % Ograniczenie wyświetlanego obszaru
    
    % Trzymanie rysunku na wykresie
    hold on;
    
    % Pętla rysująca okręgi
    if mod(index_number, 2) == 0
        % Cyfra jedności jest parzysta
        
        for i = 1:size(circles, 1)
            % Wywołanie funkcji plot_circle
            plot_circle(circles(i, 3), circles(i, 1), circles(i, 2));
            
            % Opcjonalnie, opóźnienie w celu zobrazowania kolejności losowania okręgów
            pause(0.1);
        end
    else
        % Cyfra jedności jest nieparzysta
        
        for i = 1:size(circles, 2)
            % Wywołanie funkcji plot_circle
            plot_circle(circles(1, i), circles(2, i), circles(3, i));
            
            % Opcjonalnie, opóźnienie w celu zobrazowania kolejności losowania okręgów
            pause(0.1);
        end
    end
    
    % Wyłączenie trzymania rysunku na wykresie
    hold off;
end