% Definicja dodatkowych opcji dla funkcji fzero
options = optimset('Display','iter');

% Wywołanie funkcji fzero dla pierwszego punktu startowego
[x1, fval1, exitflag1, output1] = fzero(@tan, 6, options);

% Wywołanie funkcji fzero dla drugiego punktu startowego
[x2, fval2, exitflag2, output2] = fzero(@tan, 4.5, options);

% Zapisanie wyników do pliku zadanie9.txt
fid = fopen('zadanie9.txt', 'w');

% Zapisanie wyników dla pierwszego punktu startowego
fprintf(fid, 'Wyniki dla pierwszego punktu startowego (x0 = 6):\n');
fprintf(fid, 'Wartość miejsca zerowego: %f\n', x1);
fprintf(fid, 'Wartość funkcji w miejscu zerowym: %f\n', fval1);
fprintf(fid, 'Kod wyjścia (exit flag): %d\n', exitflag1);
fprintf(fid, 'Informacje dodatkowe:\n');
fprintf(fid, '%s\n', output1.message);

fprintf(fid, '\n'); % Nowa linia oddzielająca wyniki

% Zapisanie wyników dla drugiego punktu startowego
fprintf(fid, 'Wyniki dla drugiego punktu startowego (x0 = 4.5):\n');
fprintf(fid, 'Wartość miejsca zerowego: %f\n', x2);
fprintf(fid, 'Wartość funkcji w miejscu zerowym: %f\n', fval2);
fprintf(fid, 'Kod wyjścia (exit flag): %d\n', exitflag2);
fprintf(fid, 'Informacje dodatkowe:\n');
fprintf(fid, '%s\n', output2.message);

fclose(fid);