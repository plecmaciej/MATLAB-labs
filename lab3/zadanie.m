% Krok 1: Wczytanie danych
load('filtr_dielektryczny.mat');

% Krok 2: Rozwiązanie równania liniowego Ar = b dla każdej metody
% Metoda bezpośrednia
x_direct = A\b;
[rownum,~]=size(A)

  x_jacobi = ones(rownum, 1);
    
    % Inicjalizacja macierzy M i wektora bm zgodnie z opisem z instrukcji
    D = diag(diag(A));
    L = tril(A, -1);
    U = triu(A, 1);
    M = -inv(D) * (L + U);
    bm = inv(D) * b;

    % Pomiar czasu
    

    % Iteracyjne rozwiązywanie równania macierzowego metodą Jacobiego
    max_iterations = 1000;
    tolerance = 1E-12;
    for iterations = 1:max_iterations
        x_next = M * x_jacobi + bm;
        err_norm_Jacobi = norm(A * x_next - b);
        if err_norm_Jacobi < tolerance
            break;
        end
        x_jacobi = x_next;
    end

% Metoda Gaussa-Seidla
x_gauss = ones(rownum, 1);
  M = -(D + L) \ U;
    bm = (D + L) \ b;

    % Iteracyjne rozwiązywanie równania macierzowego metodą Jacobiego
    max_iterations = 1000;
    tolerance = 1E-12;
    for iterations = 1:max_iterations
        x_next = M * x_gauss + bm;
        err_norm_Gauss_Seidel = norm(A * x_next - b);
        if err_norm_Gauss_Seidel < tolerance
            break;
        end
        x_gauss = x_next;
    end

% Krok 3: Obliczenie normy błędu rezydualnego dla każdego rozwiązania
residual_norm_direct = norm(A * x_direct - b);
fprintf('Norma błędu rezydualnego (metoda bezpośrednia): %e\n', residual_norm_direct);

fprintf('Norma błędu rezydualnego (metoda Jacobiego): %f\n', err_norm_Jacobi);

fprintf('Norma błędu rezydualnego (metoda Gaussa-Seidla): %f\n', err_norm_Gauss_Seidel);

% Krok 4: Weryfikacja zbieżności metod iteracyjnych
% Wartości normy błędu rezydualnego dla metod iteracyjnych są przechowywane w zmiennej err_norm_Jacobi oraz err_norm_Gauss_Seidel

% Krok 5: Zapis wyników i wniosków do pliku zadanie6.txt
fid = fopen('zadanie6.txt', 'w');
fprintf(fid, 'Wyniki i wnioski dla zadania 6:\n');
fprintf(fid, 'Norma błędu rezydualnego (metoda bezpośrednia): %e\n', residual_norm_direct);
fprintf(fid, 'Norma błędu rezydualnego (metoda Jacobiego): %f\n', err_norm_Jacobi);
fprintf(fid, 'Norma błędu rezydualnego (metoda Gaussa-Seidla): %f\n', err_norm_Gauss_Seidel);
fclose(fid);
