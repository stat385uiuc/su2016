## ----setup, include=FALSE------------------------------------------------
options(width = 60)
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ----syntax_foreach, eval = FALSE----------------------------------------
## # Foreach
## foreach(i = 1:3) %do% { expression }
## 
## # Base R for loop
## for(i in 1:3){ expression }

## ----simple_foreach------------------------------------------------------
library("foreach")
foreach(i = 1:3) %do% { sqrt(i) }

## ----simple_foreach_output-----------------------------------------------
x = foreach(i = 1:3, .combine='c') %do% { sqrt(i) }

x

## ----warning_foreach-----------------------------------------------------
x = foreach(a = 1:50, b = c(1,2), .combine='c') %do% {
  a + b
}

x

## ----packages_in_parallel, eval=F, size='scriptsize'---------------------
## # Loading packages on different workers
## foreach(i = 1:3, .packages=c('gmwm')) %dopar% {
##   expression
## }

## ----foreach_setup, size='scriptsize'------------------------------------
require(doParallel, quiet = TRUE) # Load library

cl = makeCluster(2)    # Create cluster for snow

registerDoParallel(cl) # Register it with doParallel

getDoParWorkers()      # See how many workers exist

# Do a parallelized loop!
foreach(i = 1:3, .combine='c') %dopar% { sqrt(i) }

stopCluster(cl)        # End cluster for snow

## ----nested_for, size='tiny'---------------------------------------------
# Standard R loop
out = character()
for(i in 1:3) {
  for(j in c("A","B")) {
    out = c(out,paste0(i,j))
  }
}

## ----nested_foreach, size='tiny'-----------------------------------------
# Nested foreach loop
foreach(i = 1:3, .combine = c) %do% {
  foreach(j = c("A","B"), .combine = c) %do% {
    paste0(i, j)
  }
}

## ----nested_foreach_parallel1, size='tiny'-------------------------------
cl = makeCluster(2)    # Create cluster for snow
registerDoParallel(cl) # Register cluster with doParallel

# foreach with overloop parallelized
foreach (i = 1:3, .combine = c, 
         .packages = 'foreach') %dopar% {
           
  foreach(j = c("A","B"), .combine = c) %do% {
    paste0(i, j)
  }
           
}

stopCluster(cl)   # End cluster for snow

## ----nested_foreach_parallel2, size='tiny'-------------------------------
cl = makeCluster(2)    # Create cluster for snow

registerDoParallel(cl) # Register cluster with doParallel

# foreach with parallel using %:%
foreach (i = 1:3, .combine = c) %:% 
  foreach(j = c("A","B"), .combine = c) %dopar% {
    paste0(i, j)
  }

stopCluster(cl)        # End cluster for snow

## ----parallel_foreach, size='scriptsize'---------------------------------
library(doRNG)         # Load doRNG

cl = makeCluster(2)    # Create cluster for snow

registerDoParallel(cl) # Register cluster with doParallel

registerDoRNG(123)     # Register a set of seeds

# Run foreach loop
parallel = foreach(i = 1:5) %dorng% {
  runif(3)             # Sample from uniform
}

stopCluster(cl)        # End cluster for snow

## ----bootstrap_example_r, size='tiny'------------------------------------
# Get Iris Data
x = iris[which(iris[,5] != "setosa"), c(1,5)]
B = 10000                           # Iteration
db = matrix(NA, nrow = 2, ncol = B) # Results

system.time({
  
   for(i in 1:B){                   # Loop
    ind = sample(100, 100, replace=TRUE)
    result = glm(x[ind,2] ~ x[ind,1],
                 family = binomial(logit))
    db[,i] = coefficients(result)
   }
  
})

## ----bootstrap_example_foreach_seq, size='tiny'--------------------------
x = iris[which(iris[,5] != "setosa"), c(1,5)]
B = 10000                 # Iteration

system.time({
  db = foreach(icount(B), .combine=cbind) %do% {
    ind = sample(100, 100, replace=TRUE)
    result = glm(x[ind,2] ~ x[ind,1],
                  family = binomial(logit))
    coefficients(result)
  }
})

## ----bootstrap_example_foreach, size='tiny'------------------------------
x = iris[which(iris[,5] != "setosa"), c(1,5)]
B = 10000                # Bootstrap iterations

cl = makeCluster(4)      # Create Cluster with 4 cores
registerDoParallel(cl)   # Register cluster for foreach

system.time({
   db = foreach(icount(B), .combine=cbind) %dopar% {
     ind = sample(100, 100, replace=TRUE)
     result = glm(x[ind,2] ~ x[ind,1],
                  family=binomial(logit))
     coefficients(result)
     }
})

## ----out, eval=F, engine="Rcpp"------------------------------------------
## #pragma compiler specific extension

## ----out2, eval=F, engine="Rcpp"-----------------------------------------
## unsigned int ncores = 2; // Number of CPUs
## 
## #pragma omp parallel num_threads(ncores)
## {
##   #pragma omp for
##   for(i = 0; i < n; i++) { a[i] = a[i] + b[i];}
## }

## ----out3, eval=F, engine="Rcpp"-----------------------------------------
## #pragma omp parallel

## ----code_convert, eval = F, engine="Rcpp"-------------------------------
## #pragma omp parallel
## {
##   int this_thread, num_threads, istart, iend;
##   id = omp_get_thread_num();
##   num_threads = omp_get_num_threads();
##   istart = this_thread * N / num_threads;
##   iend = (this_thread + 1) * N / num_threads;
##   if (this_thread == num_threads-1) { iend = N; }
## }

## ----set_flags, eval=F---------------------------------------------------
## Sys.setenv("PKG_CXXFLAGS"="-fopenmp")
## Sys.setenv("PKG_LIBS"="-fopenmp")

## ----set_flags_c, eval=F, engine="Rcpp"----------------------------------
## // [[Rcpp::plugins(openmp)]]

## ----compile_flag, eval = F, engine="bash"-------------------------------
## clang: error: unsupported option '-fopenmp'

## ----include_openmp, eval = F, engine="Rcpp"-----------------------------
## #ifdef _OPENMP
##    #include <omp.h>  // OpenMP header
## #endif

## ----sample_cpp_loop, engine="Rcpp"--------------------------------------
#include <Rcpp.h>
#ifdef _OPENMP
   #include <omp.h>  // OpenMP header
#endif
using namespace Rcpp;
// [[Rcpp::plugins(openmp)]]

// [[Rcpp::export]]
void sample_loop(unsigned int n,
                 unsigned int ncores = 2)
{
  #pragma omp parallel num_threads(ncores)
  {
    #pragma omp for 
    for (unsigned int i = 0; i < n; i++){
      // AWESOME_FUNCTION(i);
    }
  }
}

## ----sample_cpp_loop2, eval = F, engine="Rcpp"---------------------------
## #include <Rcpp.h>
## #ifdef _OPENMP
##    #include <omp.h>  // OpenMP header
## #endif
## using namespace Rcpp;
## // [[Rcpp::plugins(openmp)]]
## 
## // [[Rcpp::export]]
## void sample_loop(unsigned int n,
##                  unsigned int ncores = 2)
## {
##   #pragma omp parallel for num_threads(ncores)
##   for (unsigned int i = 0; i < n; i++){
##      // AWESOME_FUNCTION(i);
##   }
## }

## ----carried_dependency_cpp_loop, engine="Rcpp"--------------------------
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector odd_op(NumericVector x){
  unsigned int i, j, n;   // Declare variables
  n = x.size();           // Element size
  j = 1;                 
  
  for(i = 0; i < n; i++){
    j += 2;               // Dependency
    x[i] = x[i] + j;
  }
  
  return x;
}

## ----carried_independence_cpp_loop, eval = F, engine="Rcpp"--------------
## // [[Rcpp::export]]
## NumericVector odd_op_para(NumericVector x,
##                           unsigned int ncores = 2){
##   unsigned int i, n;
##   n = x.size();
## 
##   #pragma omp parallel for num_threads(ncores)
##   for(i = 0; i < n; i++){
##     unsigned int j = 1 + 2*i; // indep
##     x(i) = x(i) + j;
##   }
## 
##   return x;
## }

## ----dependency_p2, size='tiny', engine="Rcpp"---------------------------
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
double average(NumericVector x){
  unsigned int i, n;
  double sum = 0.0;
  n = x.size();
  
  for (i = 0; i < n; i++) {
    sum += x(i);            // ewk!
  }
  return sum/n;
}

## ----reduc, eval=F-------------------------------------------------------
## var = var op expr

## ----reduction, eval=F, engine="Rcpp"------------------------------------
## #pragma omp parallel for reduction (op:variable)

## ----independence_p2, cache=TRUE, eval = F, engine="Rcpp"----------------
## // [[Rcpp::export]]
## double average_parallel(NumericVector x,
##                           unsigned int ncores = 2){
##   unsigned int i, n;
##   double sum = 0.0;
##   n = x.size();
## 
##   #pragma omp parallel for reduction(+:sum) num_threads(ncores)
##   for (i = 0; i < n; i++) {
##     sum += x[i];
##   }
##   return sum/n;
## }

## ----pi_problem_r--------------------------------------------------------
pi_me_r = function(){ 
  
  num_steps = 100000
  x = sum_x = 0.0
  
  step = 1.0/num_steps
  
  for (i in 1:num_steps){
    x = (i + 0.5)*step
    sum_x = sum_x + 4.0/(1.0 + x*x)
  }
  
  return(step * sum_x) # Pi
}

## ----pi_problem, size='tiny', engine="Rcpp"------------------------------
#include <Rcpp.h>

// [[Rcpp::export]]
double pi_me(){ 

  unsigned int num_steps = 100000;
  double x, pi, sum = 0.0;
  double step = 1.0/(double) num_steps;
  
  for (unsigned int i = 0; i < num_steps; i++){
    x = (i + 0.5)*step;
    sum = sum + 4.0/(1.0 + x*x);
  }
  return step * sum;
}

## ----adv_pi_problem, eval = F, engine="Rcpp"-----------------------------
## // [[Rcpp::export]]
## double pi_me_parallel(unsigned int ncores = 2){
##   unsigned int num_steps = 100000;
##   unsigned int i; // declared earlier for parallel
##   double x, sum = 0.0;
##   double step = 1.0/(double) num_steps;
## 
##   #pragma omp parallel for reduction(+:sum) num_threads(ncores)
##   for (i = 0; i < num_steps; i++){
##     x = (i + 0.5)*step;
##     sum = sum + 4.0/(1.0 + x*x);
##   }
##   return step * sum; // Pi
## }

## ----adv_pi2, echo = F, engine="Rcpp"------------------------------------
#include <Rcpp.h>
#include <omp.h>
using namespace Rcpp;
// [[Rcpp::plugins(openmp)]]
// [[Rcpp::export]]
double pi_me_parallel(unsigned int ncores = 2){
  unsigned int num_steps = 100000;
  unsigned int i; // declared earlier for parallel
  double x, sum = 0.0;
  double step = 1.0/(double) num_steps;
  
  #pragma omp parallel for reduction(+:sum) num_threads(ncores) 
  for (i = 0; i < num_steps; i++){
    x = (i + 0.5)*step;
    sum = sum + 4.0/(1.0 + x*x);
  }
  return step * sum; // Pi
}

## ----benchmark_pi, echo=FALSE, results='asis'----------------------------
library(rbenchmark)
knitr::kable(
  benchmark(cpp.parallel = pi_me_parallel(), cpp.serial = pi_me(), r = pi_me_r(),
            columns = c("test", "replications", "elapsed", "relative", "user.self", "sys.self"), 
            order = "relative")
)

## ----enable_multi_threaded_blas, eval=FALSE, size='scriptsize', engine="bash"----
## cd /Library/Frameworks/R.framework/Resources/lib
## 
## # For R <= 2.15 version (old school R users)
## # Line 2:
## ln -sf libRblas.vecLib.dylib libRblas.dylib
## 
## # For R >= 3.0 version (Latest Install)
## # Line 2:
## ln -sf /System/Library/Frameworks/Accelerate.framework
## /Frameworks/vecLib.framework/Versions/Current/
## libBLAS.dylib libRblas.dylib

## ----benchmark_code, eval=FALSE, size='small'----------------------------
## # Create matrix
## set.seed(1234)
## a = crossprod(matrix(rnorm(3000^2),nrow=3000,ncol=3000))
## 
## #install.packages("rbenchmark")  # Install Package
## library(rbenchmark)           # Load Benchmark Package
## benchmark(chol(a))            # Benchmark 100 times

## ---- disable_multi_threaded_blas, eval = FALSE, engine="bash"-----------
## # Open terminal and type the following:
## Line 1: cd /Library/Frameworks/R.framework/Resources/lib
## 
## Line 2: ln -sf libRblas.0.dylib libRblas.dylib

