---
title: "Lecture 17: Parallel Processing in R and Rcpp"
author: "STAT 385 - James Balamuta"
date: "July 28, 2016"
layout: post
categories: lectures
tags: [r, hpc, high performance computing, openmp, rcpp, foreach, doParallel]
---

# Overview

Continuing from the previous class, we opt to explore in greater detail 
different parallelization scenarios using `Rcpp` and `doParallel`. Parallelization
within `Rcpp` will be dealt with using `OpenMP` instead of 
[`RcppParallel`](https://www.threadingbuildingblocks.org/), which uses
[thread building blocks (TBB)](https://rcppcore.github.io/RcppParallel/).

# Files of Interest 

Rendered Files:

* [Lecture 17: Parallel Processing in R and Rcpp (PDF)](/assets/lectures/lec17/lec17-parallel-processing-in-r-and-rcpp.pdf)

Generation Files:

* [Lecture 17: Parallel Processing in R and Rcpp (Rmd)](/assets/lectures/lec17/lec17-parallel-processing-in-r-and-rcpp.Rmd)
* [Lecture 17: Parallel Processing in R and Rcpp (R)](/assets/lectures/lec17/lec17-parallel-processing-in-r-and-rcpp.R)

# Source Material

Source of all materials: 

* <http://github.com/coatless/stat385/tree/gh-pages/assets/lectures/lec17>
