## ----setup, include=FALSE------------------------------------------------
options(width = 60)
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ----quad_core_cpu, out.width = "125px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/cpu_i7.jpg")

## ----quad_core, out.width = "125px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics(c("img/quad_core_inside.jpg","img/LFDDieLayout.jpg"))

## ----cpp_file_create_dropdown, out.width = "125px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/cpp_file_dropdown.png")

## ----cpp_file_create, out.width = "100px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/create_cpp.png")

## ----rcpp_in_rstudio, out.width = "325px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/rstudio_editor_cpp.png")

## ----eval = F------------------------------------------------------------
## Rcpp::sourceCpp("rcpp_twotimes.cpp")

## ----rcpp_source, out.width = "125px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/source_cpp.png")

## ----eval = F------------------------------------------------------------
## timesTwo(42)
## ## [1] 84

## ----eval = F, engine="Rcpp"---------------------------------------------
## #include <Rcpp.h>     // Includes the Rcpp C++ header
##                       // Akin to calling library(Rcpp)
##                       // in C++

## ----eval = F, engine="Rcpp"---------------------------------------------
## using namespace Rcpp; // C++ search scope

## ----eval = F, engine="Rcpp"---------------------------------------------
## #include <Rcpp.h>     // Includes the Rcpp C++ header
## using namespace Rcpp; // C++ search scope

## ----eval = F, engine="Rcpp"---------------------------------------------
## /* Group comment
##  Across Multiple Lines
##  */
## 
## // Single line comment

## ------------------------------------------------------------------------
# pound/hash commment

## ----eval = F------------------------------------------------------------
## hello = function(){
##   cat("Hello R/C++ World!\n")
## }

## ----hello_world_ex2, eval = F, engine="Rcpp"----------------------------
## // Akin to cat("Hello R/C++ World!\n")
## void hello() {                      // Declaration
##   Rcout << "Hello R/C++ World!\n";  // cat() in C++
## }

## ---- eval = F, engine="Rcpp"--------------------------------------------
## // [[Rcpp::export]]

## ----hello_world_ex, engine="Rcpp"---------------------------------------
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
void hello() {
  Rcout << "Hello R/C++ World!\n";  
}

## ----engine="Rcpp"-------------------------------------------------------
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
void hello() {
  Rcout << "Hello R/C++ World!\n";  
}

## ------------------------------------------------------------------------
# Call C++ Code like a normal R function
hello()    

## ----engine="Rcpp"-------------------------------------------------------
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
void hello() {
  Rcout << "Hello R/C++ World!\n";  
}
/*** R
# This is R code in the C++ code file!
hello()
*/

## ------------------------------------------------------------------------
hello

## ------------------------------------------------------------------------
add = function(a,b){
  return(a + b)
}

add(0L, 2L)   # Remember L means integer!
add(2.5, 1.1) # Double/numeric

## ----engine="Rcpp"-------------------------------------------------------
#include <Rcpp.h>
using namespace Rcpp;           // Import Statements

// [[Rcpp::export]]
double addRcpp(double a, double b) { // Declaration
  double out = a + b; // Add `a` to `b`
  return out;         // Return output
}

## ------------------------------------------------------------------------
add(0L, 2L)   # Integers into double
add(2.5, 1.1) # Double into double

## ----engine="Rcpp"-------------------------------------------------------
#include <Rcpp.h>
using namespace Rcpp;           // Import Statements

// [[Rcpp::export]]
double addRcpp(double a, double b) { // Declaration
  double out = a + b;           // Add `a` to `b`
  return out;                   // Return output
}

// [[Rcpp::export]]
int addRcppInt(int a, int b) { // Declaration
  return addRcpp(a, b);        // Call previous function
}

## ------------------------------------------------------------------------
addRcppInt(2.5, 1.1)  # Call in *R*

## ------------------------------------------------------------------------
muR = function(x) {
  sum_r = 0
  for (i in seq_along(x)) {
    sum_r = sum_r + x[i]
  }
  
  sum_r / length(x)
}

## ----mean, engine="Rcpp"-------------------------------------------------
#include <Rcpp.h>
using namespace Rcpp;           // Import Statements

// [[Rcpp::export]]
double muRcpp(NumericVector x) { // Declaration
  
  int n = x.size();              // Find the vector length
  double sum_x = 0;              // Set up storage

  for(int i = 0; i < n; ++i) {   // For Loop in C++
    // Shorthand for sum_x = sum_x + x[i];
    sum_x += x[i];   
  }
  return sum_x / n;             // Return division
}

## ------------------------------------------------------------------------
# Done in *R*

set.seed(112)                # Set seed

x = rnorm(10)                # Generate data

all.equal(muRcpp(x), muR(x)) # Test Functions

## ----proxy_success, engine="Rcpp"----------------------------------------
#include <Rcpp.h>
using namespace Rcpp;           // Import Statements

// [[Rcpp::export]]
void ref_ex(IntegerVector x) { // Declaration
  x = x + 1; // Add 1 and save it to x via Rcpp Sugar
}

## ------------------------------------------------------------------------
(x = 1:10)  # Span from 1 to 10
ref_ex(x)   # No output due to no return
x           # Different Span!

## ------------------------------------------------------------------------
(x = seq(0.5,5.5))  # Span from 0.5 to 5.5
ref_ex(x)            # No output due to no return
x                    # Same span????

## ----eval = F------------------------------------------------------------
## typeof(x)

