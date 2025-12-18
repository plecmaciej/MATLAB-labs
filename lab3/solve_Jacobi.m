function [A,b,M,bm,x,err_norm,time,iterations,index_number] = solve_Jacobi(N)
    % A - macierz z równania macierzowego A * x = b
    % b - wektor prawej strony równania macierzowego A * x = b
    % M - macierz pomocnicza opisana w instrukcji do Laboratorium 3
    % bm - wektor pomocniczy opisany w instrukcji do Laboratorium 3
    % x - rozwiązanie równania macierzowego
    % err_norm - norma błędu rezydualnego rozwiązania x; err_norm = norm(A*x-b)
    % time - czas wyznaczenia rozwiązania x
    % iterations - liczba iteracji wykonana w procesie iteracyjnym metody Jacobiego
    % index_number - Twój numer indeksu
    index_number = 193755;
    L1 = mod(index_number, 10);

    % Generowanie macierzy A i wektora b za pomocą funkcji generate_matrix
    [A, b] = generate_matrix(N, L1);
    
    % Inicjalizacja wektora x wartościami początkowymi
    x = ones(N, 1);
    
    % Inicjalizacja macierzy M i wektora bm zgodnie z opisem z instrukcji
    D = diag(diag(A));
    L = tril(A, -1);
    U = triu(A, 1);
    M = -inv(D) * (L + U);
    bm = inv(D) * b;

    % Pomiar czasu
    tic;

    % Iteracyjne rozwiązywanie równania macierzowego metodą Jacobiego
    max_iterations = 1000;
    tolerance = 1E-12;
    for iterations = 1:max_iterations
        x_next = M * x + bm;
        err_norm = norm(A * x_next - b)
        if err_norm < tolerance
            break;
        end
        x = x_next;
    end

    % Pomiar czasu wykonania
    time = toc;
end
