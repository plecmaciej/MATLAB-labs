function [numer_indeksu, Edges, I, B, A, b, r] = page_rank()
    % Numer indeksu
    numer_indeksu = 193755;
    L1 = mod(numer_indeksu, 10);
    L2 = mod(floor(numer_indeksu / 10), 10);
    
    % Macierz Edges dla zmodyfikowanej sieci
    Edges = [ 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 6, 6, 7, 8;
              4, 6, 8, 3, 4, 5, 5, 6, 7, 5, 6, 4, 6, 4, 7, 6, 6];
    
 % Rozmiar sieci
    N = 8;
    
    % Macierz jednostkowa I
    I = speye(N);
    
    % Macierz sąsiedztwa B
    B = sparse(Edges(2, :), Edges(1, :), 1, N, N);
    
    % macierz A
    L = sum(B, 1)';
    A = spdiags(1./L, 0, N, N);
    
    % Prawa strona równania
    d = 0.85;
    b = ((1 - d) / N) * ones(N, 1);
    
    % Macierz M
    M = I - d * B * A;
    
    % Rozwiązanie układu równań
    r = M \ b;
end