%1




%2
%{
N = 1000:1000:8000;
n = length(N);
vtime_direct = ones(1,n);
for i = 1:n
    % Wywołanie funkcji solve_direct i zapisanie czasu do wektora vtime_direct
    [~, ~, ~, time_direct, ~, ~] = solve_direct(N(i));
    vtime_direct(i) = time_direct;
end
plot_direct(N,vtime_direct);
saveas(gcf, 'zadanie2.png');
%}
%3
%{
N = 100;
[A,b,M,bm,x,err_norm,time,iterations,index_number] = solve_Jacobi(N);
%}
%4
%N = 100;
%[A,b,M,bm,x,err_norm,time,iterations,index_number] = solve_Gauss_Seidel(N);

%5
N = 1000:1000:8000;
n = length(N);
time_Jacobi = ones(1, n);
time_Gauss_Seidel = 2 * ones(1, n);
iterations_Jacobi = 40 * ones(1, n);
iterations_Gauss_Seidel = 40 * ones(1, n);

for i = 1:n
    [A, b, M_J, bm_J, x_J, err_norm_J, time_J, iterations_Jacobi(i), index_number] = solve_Jacobi(N(i));
    time_Jacobi(i) = time_J;
    
    [A, b, M_GS, bm_GS, x_GS, err_norm_GS, time_GS, iterations_Gauss_Seidel(i), index_number] = solve_Gauss_Seidel(N(i));
    time_Gauss_Seidel(i) = time_GS;
end

plot_problem_5(N, time_Jacobi, time_Gauss_Seidel, iterations_Jacobi, iterations_Gauss_Seidel);

