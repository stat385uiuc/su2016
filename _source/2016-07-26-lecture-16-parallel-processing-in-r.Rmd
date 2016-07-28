---
title: "Lecture 16: Parallel Processing in R"
author: "STAT 385 - James Balamuta"
date: "July 26, 2016"
layout: post
categories: lectures
tags: [r, hpc, high performance computing, parallel, snow]
---

# Overview

The world is at an impass with how fast the clock speed of a single processing
unit can be made. In order to gain speed, the routines which are serially or
sequentially implemented are being changed into parallel routines. In turn,
consumer grade hardware (e.g. your laptop, desktop, iDevice) now has **multiple**
cores that are being used to speed up the calculation. Within this lecture, the
notion of parallelization within *R* will be addressed along with different
concepts of parallelization. 

# Files of Interest 

Rendered Files:

* [Lecture 16: Parallel Processing in R (PDF)](/assets/lectures/lec16/lec16-parallel-processing-in-r.pdf)

Generation Files:

* [Lecture 16: Parallel Processing in R (Rmd)](/assets/lectures/lec16/lec16-parallel-processing-in-r.Rmd)
* [Lecture 16: Parallel Processing in R (R)](/assets/lectures/lec16/lec16-parallel-processing-in-r.R)

# Source Material

Source of all materials: 

* <http://github.com/coatless/stat385/tree/gh-pages/assets/lectures/lec16>
