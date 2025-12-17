function plot_counts_mean(counts_mean)
 plot(counts_mean);
 xlabel('Indeks');
 ylabel('Średnia liczba losowań');
 title('Wykres średniej liczby losowań');
    %grid on;
    %set(gca,'xscale','linear');
    %set(gca,'yscale','linear');
 print -dpng zadanie5.png 
end