function [circles, index_number, circle_areas, rand_counts, counts_mean] = generate_circles(a, r_max, n_max)
    % Pobranie cyfry jedności z numeru indeksu
    index_number = 193755;
    L1 = mod(index_number, 10);
    teners = fix(index_number / 10);
    L2 = mod(teners, 2);
    
    % Inicjalizacja macierzy circles
    if mod(L1, 2) == 0
        % Cyfra jedności jest parzysta
        
        % Inicjalizacja macierzy circles z n_max wierszami i 3 kolumnami
        circles = zeros(n_max, 3);
        rand_counts = zeros(n_max, 1);
        
        for i = 1:n_max
            found = false;
            % Losowanie współrzędnych X, Y oraz promienia R
            count = 0;
            while ~(found)
            collision = false;
            count = count + 1;
            R = rand() * r_max;
            X = R + (a - 2*R) * rand(); % Zakres (R, a - R)
            Y = R + (a - 2*R) * rand(); % Zakres (R, a - R)
            
            % Sprawdzenie kolizji
            
                for j = 1:size(circles, 1)
                    % X,Y,R
                    distance = sqrt((X - circles(j, 1))^2 + (Y - circles(j, 2))^2);
                    if distance < R + circles(j, 3)
                        collision = true;
                        break;
                    end
                end
                if ~collision
                    found = true;
                end
            end
            % Jeśli nie ma kolizji, dodaj nowy okrąg
            if ~collision
                circles(i, :) = [X, Y, R];
                rand_counts(i) = count;
            end
        end
        % Obliczanie sumy pól pierwszych i wylosowanych kół
        if L2 == 0
            circle_areas = cumsum(circles(:, 3).^2 * pi);
        else 
            circle_areas = cumsum(circles(1, :) .^ 2 * pi)';
        end
    else
        % Cyfra jedności jest nieparzysta
        
        % Inicjalizacja macierzy circles z 3 wierszami i n_max kolumnami
        circles = zeros(3, n_max);
        for i = 1:n_max
            found = false;
            count = 0;
            while ~found
                collision = false;
                % Losowanie promienia R, współrzędnej X oraz Y
                count = count + 1;
                R = rand() * r_max;
                X = R + (a - 2*R) * rand(); % Zakres (R, a - R)
                Y = R + (a - 2*R) * rand(); % Zakres (R, a - R)
                
                % Sprawdzenie kolizji
                for j = 1:n_max
                    distance = sqrt((X - circles(2, j))^2 + (Y - circles(3, j))^2);
                    if distance < R + circles(1, j)
                        collision = true;
                        break;               
                    end
                end
    
                if ~collision
                    found = true;
                end
            end
            if ~collision
               circles(:, i) = [R; X; Y];
               rand_counts(i) = count;
            end
        end
        if L2 == 0
            circle_areas = cumsum(circles(:, 3).^2 * pi);
        else 
            circle_areas = cumsum(circles(1, :) .^ 2 * pi)';
        end
    end
    counts_mean = reshape(cumsum(rand_counts) ./ (1:n_max), [], 1);
end