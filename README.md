# Numerical Methods – MATLAB Laboratories

This repository contains MATLAB scripts developed for laboratory classes in the **Numerical Methods** course.  
Each laboratory focuses on selected numerical algorithms and their practical implementation, including data analysis and visualization.

The repository is organized into separate laboratory tasks, which are added progressively as the course advances.

# Laboratory 2  
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

# Numerical Methods – Laboratory 3  
**Direct and Iterative Methods for Solving Linear Systems**

This laboratory focuses on the analysis and implementation of **direct** and **iterative** methods for solving systems of linear equations.  
All tasks were implemented in **MATLAB** and are intended for educational purposes within the *Numerical Methods* course.

The general problem considered in this laboratory is the matrix equation:

A · r = b

where:
- **A** is a square matrix,
- **b** is the right-hand-side vector,
- **r** is the vector of unknowns (solution vector).

---

## Laboratory Objectives

The main goals of this laboratory are:
- to understand the differences between **direct** and **iterative** methods,
- to analyze numerical accuracy and computational efficiency,
- to implement and compare the **Jacobi** and **Gauss–Seidel** iterative methods,
- to evaluate convergence using the residual norm.

---

## Methods Overview

### Direct Methods
Direct methods compute the exact solution (up to numerical precision) in a finite number of operations.  
In MATLAB, solving a linear system using:
```matlab
r = A \ b
```
MATLAB automatically selects an efficient algorithm (typically **LU decomposition** for the matrices used in this laboratory) when solving linear systems using the backslash operator.

> **Note:**  
> As a general rule in numerical analysis, **matrix inversion should not be used** to solve linear systems.  
> Computing the inverse of a matrix is computationally expensive and often leads to numerical instability and reduced accuracy.  
> Instead, direct or iterative solution methods should be applied.

## Iterative Methods

Iterative methods generate a sequence of approximate solutions that converge toward the exact solution.

### Jacobi Method

The Jacobi method is derived from splitting the matrix **A** into:

- diagonal matrix **D**,
- strictly lower triangular matrix **L**,
- strictly upper triangular matrix **U**.

The iteration scheme is defined as:
r(k+1) = −D⁻¹(L + U) r(k) + D⁻¹ b

### Gauss–Seidel Method

The Gauss–Seidel method improves convergence by using updated values during iteration:
r(k+1) = −(D + L)⁻¹ U r(k) + (D + L)⁻¹ b

Instead of computing matrix inverses, **forward substitution** is used via MATLAB’s backslash operator.

---

## Convergence and Residual Analysis

The stopping criterion for iterative methods is based on the **residual vector**:
res(k) = A · r(k) − b

The norm of the residual vector is used to estimate the accuracy of the current approximation.  
A smaller residual norm indicates a more accurate solution.

---

## Tasks Summary

The laboratory consists of six tasks:

1. **Direct method:** implementation  
2. **Direct method:** result visualization  
3. **Jacobi method:** implementation  
4. **Gauss–Seidel method:** implementation  
5. **Performance analysis and comparison**  
6. **Microwave filter problem** (large-scale linear system)

Tasks 1–5 were verified using **MATLAB Grader**.  
Task 6 required additional analysis and written conclusions.

---

## Microwave Filter Problem (Task 6)

This task involves solving a large linear system originating from the electromagnetic analysis of a **microwave dielectric filter** operating at approximately 10 GHz.

The matrix **A** and vector **b** are loaded from the file:
filtr_dielektryczny.mat

Three solution approaches are applied:

- direct method,  
- Jacobi method,  
- Gauss–Seidel method.

For each method, the **residual norm** is evaluated and the convergence behavior is analyzed.  
The conclusions and observations are stored in the file:
zadanie6.txt
