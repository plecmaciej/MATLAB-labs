# Numerical Methods – MATLAB Laboratories

This repository contains MATLAB scripts developed for laboratory classes in the **Numerical Methods** course.  
Each laboratory focuses on selected numerical algorithms and their practical implementation, including data analysis and visualization.

The repository is organized into separate laboratory tasks, which are added progressively as the course advances.

# Laboratory 1  
**MATLAB: Circles (“Bubbles”) and PageRank**

This repository contains solutions for **Laboratory 1** of the *Numerical Methods* course, implemented in **MATLAB**.  
The laboratory focuses on two main problems:
- random generation of non-overlapping circles (“Bubbles”),
- analysis of a directed network using the **PageRank** algorithm with sparse matrices.

---

## Laboratory Scope

The laboratory consists of **7 tasks**:
- **Tasks 1–5**: Circles (“Bubbles”) problem,
- **Tasks 6–7**: PageRank algorithm.

The correctness of the solutions was verified using **MATLAB Grader**, and the obtained score was converted into laboratory points according to the course rules.

---

## Circles (“Bubbles”) – Tasks 1–5

The goal of this part was to randomly place circles with varying radii inside a square of side length `a` such that:
- each circle is fully contained within the square,
- no two circles overlap.

### Functionality
- random generation of circle radius and center coordinates,
- collision detection with previously generated circles,
- counting the number of random attempts required to place each circle,
- computation of cumulative circle areas,
- generation of plots:
  - spatial distribution of circles,
  - cumulative area of circles.

---

## PageRank – Tasks 6–7

This part focuses on computing the **PageRank vector** for a given directed graph.

### Key aspects
- representation of the graph using **sparse matrices**,
- construction of the adjacency matrix based on edge lists,
- formulation and solution of a linear system defining PageRank,
- visualization of the ranking values.

---

## Repository Structure  
├── generate_circles.m - Circle generation and statistics  
├── page_rank.m - PageRank computation  
├── plot_circle.m - Single circle plotting function  
├── plot_circles.m - Visualization of all circles  
├── plot_circle_areas.m - Cumulative area plot  
├── plot_counts_mean.m - Mean number of random attempts plot  
├── plot_PageRank.m - PageRank bar plot  
├── main.m - Script executing all tasks  
└── *.png - Generated plots  



