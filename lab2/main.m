clear all
n_max = 200;
a = 20;
r_max = 10;
[circles, index_number, circle_areas, rand_counts, counts_mean] = generate_circles(a, r_max, n_max);
plot_circles(a, circles, index_number);
plot_circle_areas(circle_areas);
plot_counts_mean(counts_mean);
[numer_indeksu, Edges, I, B, A, b, r] = page_rank();
plot_PageRank(r);