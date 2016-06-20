## ----setup, include=FALSE------------------------------------------------
library("knitr")
knitr::opts_chunk$set(echo = FALSE)

## ---- out.width = "150px", fig.retina = NULL, fig.align='center', echo = F, cache = T----
knitr::include_graphics("figures/smiley_face.png")

## ----logical_ops, echo = F, cache = T------------------------------------
d = data.frame(Operator = c("`x == y`","`x != y`","`x < y`", "`x > y`", "`x <= y`", "`x >= y`","`!x`","`x || y`","`x && y`"),
               Explanation = c("`x` equal to `y`", "`x` not equal to `y`",
                                "`x` less than `y`","`x` greater than `y`",
                               "`x` less than or equal to `y`","`x` greater than or equal to `y`",
                                "not `x`",
                               "`x` or `y`","`x` and `y`"),
               Example = c( "` 1 == 10`", "`1 != 10`","`1 < 10`", "`1 > 10`","`1 <= 10`","`1 >= 10`","`!(1 < 10)`","`FALSE || TRUE`","`(1 < 10) && (15 > 10)`"),
               Result = c("`FALSE`","`TRUE`","`TRUE`","`FALSE`","`TRUE`","`FALSE`","`FALSE`","`TRUE`","`TRUE`"))

knitr::kable(d[1:6,1:2])

## ----logical_ops_combine, echo = F, cache = T, dependson="logical_ops"----
knitr::kable(d[7:9,1:2], row.names = F)

## ----logical_ops_example, echo = F, cache = T, dependson="logical_ops"----
knitr::kable(d[,2:4])

## ----venn_diagram_x_v2, out.width = "100px", fig.retina = NULL, fig.align='center', echo = F, cache = T----
knitr::include_graphics("figures/venn_diagram_x_v2.png")

## ----venn_diagram_notx_v2, out.width = "100px", fig.retina = NULL, fig.align='center', echo = F, cache = T----
knitr::include_graphics("figures/venn_diagram_notx_v2.png")

## ----venn_diagram_xandy, out.width = "100px", fig.retina = NULL, fig.align='center', echo = F, cache = T----
knitr::include_graphics("figures/venn_diagram_xandy.png")

## ----venn_diagram_xory, out.width = "100px", fig.retina = NULL, fig.align='center', echo = F, cache = T----
knitr::include_graphics("figures/venn_diagram_xory.png")

## ---- eval = F, echo = T-------------------------------------------------
## x = 0; y = 4         # Define Variables
## (x != 0 &&  y/x > 0) # Evaluates only x != 0
##                      # so y/x never runs.

## ----sequential_diagram, out.width = "100px", fig.retina = NULL, fig.align='center', echo = F, cache = T----
knitr::include_graphics("figures/sequential_diagram.png")

## ----selection_diagram, out.width = "100px", fig.retina = NULL, fig.align='center', echo = F, cache = T----
knitr::include_graphics("figures/selection_diagram.png")

## ---- eval = F, echo = T-------------------------------------------------
## if (expression){ # True Case
##   # statement
## }

## ---- eval = F, echo = T-------------------------------------------------
## if (expression){ # True Case
##   # statement
## } else {         # False Case
##   # statement
## }

## ---- echo = T-----------------------------------------------------------
x = 2
if (x > 0){   # Detect if x is a positive number
  cat(x,"\n") # Print `x` to console 
}

## ---- echo = T, engine='R'-----------------------------------------------
if (x != 42){    # True Case
  cat("This is not the meaning of life\n") 
  x = 42
} else {         # False Case
  cat("This is the meaning of life!\n") 
}

## ---- eval = F, echo = T, engine='R'-------------------------------------
## if (x < 1)
##   cat("True\n")
## else
##   cat("False\n")
##   cat("Too bad!\n");

## ---- eval = F, echo = T, engine='R'-------------------------------------
## user_input = readline(prompt="Enter y or n:")
## if (user_input != "y" || user_input != "n")
##   cat("Please enter either y or n (y for yes and n for no)\n")

## ---- eval = F, echo = T, engine='R'-------------------------------------
## x = 9; y = 20
## if (x < 10) && (y < 35)
##   cat("Bingo was his name!\n")

## ---- eval = F, echo = T, engine='R'-------------------------------------
## x = 43
## if (x == 42 || 43 || 44)
##   cat("That's close to my age!\n")

## ---- eval = F, echo = T, engine='R'-------------------------------------
## x = seq(0,1,by = 0.1)
## y = seq(.1,1.1,by = 0.1)
## if (x < y)
##   TRUE

## ---- eval = F, echo = T, engine='R'-------------------------------------
## ifelse(expression, TRUE-CONDITION, FALSE-CONDITION)

## ---- echo = T, engine='R', cache = T------------------------------------
x = seq(0,1,by = 0.1)
y = seq(0.1,1.1,by = 0.1)
ifelse(x < y, TRUE, FALSE)

## ---- eval = F, echo = T, engine='R'-------------------------------------
## if(expression){
##     # statements
## } else if (expression2){
##     # statements
## } else {
##     # statements
## }

## ---- echo = T, cache = T------------------------------------------------
x = 3
if (x ==1) {
  cat('Equal\n')
} else if (x > 1){
  cat('Greater Than\n')
} else {
  cat('Less Than\n')
}

## ---- echo = T, cache = T------------------------------------------------
x = 3
if (x == 42) {
  cat('Equal\n')
} else {
  if (x > 42){
    cat('Greater Than\n')
  } else {
    cat('Less Than\n')
  }
}

## ---- echo = T, cache = T------------------------------------------------
ifelse(x == 42, 'Equal', 
       ifelse(x > 42, 'Greater Than', 'Less Than'))

## ---- eval = F, echo  =T-------------------------------------------------
## if(expression) TRUE  else  FALSE

## ---- eval = F, echo  =T-------------------------------------------------
## x = 42
## a = if(x == 42) TRUE else FALSE # Verbose
## a = (x == 42)                   # Concise

## ---- eval = F, echo = T-------------------------------------------------
## switch(type,
##        case_1 = statement_1,
##        case_2 = statement_2,
##        statement_3 # Default / Else
## )

## ---- eval = F, echo = T-------------------------------------------------
## if (type == case_1){
##   # statement 1
## } else if (type == case_2){
##   # statement 2
## } else{
##   # statement 3
## }

## ---- echo = T-----------------------------------------------------------
switch(1, 
       "First",
       "Second")

## ----  echo = T----------------------------------------------------------
switch("toad", 
       prince = "First", 
       toad = "Second", 
       "Third")

## ---- eval = F, echo = T-------------------------------------------------
## switch(2,
##        prince = "First",
##        toad = "Second",
##        "Third")

## ---- eval = F, echo = T-------------------------------------------------
## switch(4,               ## Switched to Numeric
##        prince = "First",
##        toad = "Second",
##        "Third")

## ----  eval = F, echo = T------------------------------------------------
## switch("Fourth",           ## Switched to Named
##        prince = "First",
##        toad = "Second",
##        "Third")

## ----echo = T, eval = F--------------------------------------------------
## cat("Hello World!\n")
## cat("Hello World!\n")
## cat("Hello World!\n")

## ---- echo = T, eval = F-------------------------------------------------
## summed = 0             # Output Variable
## for (i in 1:5) {       # Iteration Sequence
##   summed = summed + i  # Statement
## }

## ---- echo = T, eval = F-------------------------------------------------
## x = c("coffee","doppio espresso",
##       "iced coffee", "cold brew")
## 
## for (i in x) {
##   cat(x[i],"\n")
## }
## 
## for (i in 1:4) {
##   cat(x[i],"\n")
## }

## ---- echo = T, eval = F-------------------------------------------------
## a = numeric(0)
## for(i in 1:length(a)){
##   cat("Hello!\n")
## }

## ---- echo = T, eval = F-------------------------------------------------
## a = numeric()
## for(i in seq_len(length(a))){
##   cat("Hello!\n")
## }
## 
## for(i in seq_along(a)){
##   cat("Hello!\n")
## }

## ---- echo = T, eval = F-------------------------------------------------
## for (i in 1:4) {
##   if(i == 2){
##     next      # skip case 2
##   }
##   cat(x[i],"\n")
## }

## ---- echo = T, eval = F-------------------------------------------------
## while (expression) {
##   # statement
## 
##   # change logic
## }

## ---- echo = T, eval = F-------------------------------------------------
## i = 1
## while (i < 3) {
##   cat(i, "\n")
##   i = i + 1    # Do not forget to increment!
## }

## ---- echo = T, eval = F-------------------------------------------------
## i = 1
## while (i < 5) {
##   if(i == 3){  # Stops the loop at the 3rd iteration.
##     break
##   }
##   cat(i, "\n")
##   i = i + 1    # Do not forget to increment!
## }

## ---- echo = T, eval = F-------------------------------------------------
## x = 1
## y = 10
## ntrials = 0
## repeat{
## 
##   if(runif(1) > 0.5){
##     x = x + 1
##   }
## 
##   ntrials = ntrials + 1
## 
##   if(x < y){
##     break
##   }
## }

## ----the_big_o, out.width = "100px", fig.retina = NULL, fig.align='center', echo = F, cache = T----
knitr::include_graphics("figures/the_big_o.png")

## ----big_o_runtime, cache = T, echo = F----------------------------------
library("ggplot2");library("reshape2")
N = 1:50    # Calculate some different N sample sizes
obs = length(N) # Determine length

# Create a wide data set
d = data.frame(Constant = rep(1,obs),
               SquareRoot = sqrt(N),
               Logarithmic = log(N),
               Quadlogarithmic = log(N)^2,
               LogLinear = N*log(N),
               Quadratic = N^2,
               Exponential = 2^N,
               Factorial = factorial(N),
               Size = N)

# Wide to Long
d2 = melt(d, id.vars = "Size", variable.name = "Method", value.name = "RunTime")
d2 = d2[is.finite(d2$RunTime) & d2$RunTime < 1e4,]
ggplot(d2) + geom_line(aes(x = Size, y = RunTime, color = Method)) + ggtitle("Run Time vs. Sample Size") + xlab("Sample Size") + ylab("Run Time")

## ---- eval = F, echo = T-------------------------------------------------
## myfun = function(x){}

## ---- eval = F, echo = T-------------------------------------------------
## return(x)

## ---- eval = F, echo = T-------------------------------------------------
## statement 1
## statement 2
## ...
## statement n

## ---- eval = F, echo = T-------------------------------------------------
## if (expression){ # True Case
##   # statement 1
## } else {         # False Case
##   # statement 2
## }

## ---- eval = F, echo = T-------------------------------------------------
## for(i in 1:n){ # Loop incrementor
##   # statement
## }

## ----echo = T------------------------------------------------------------
sum_vec = function(x){        # Cost: 0
  total_sum = 0               # Cost: 1
  
  # Cost: 1 (Variable), N+1 (In Check), 2N (i = i + 1)
  for(i in seq_len(nrow(x))){
    # Cost: 2N (1 addition, 1 assignment)
    total_sum = total_sum + i 
  }
  
  return(total_sum)           # Cost: 0
}

## ---- eval = F, echo = T-------------------------------------------------
## for(i in 1:I){     # Loop incrementor
##   for(j in 1:J){   # Loop incrementor
##     for(k in 1:K){ # Loop incrementor
##       # statement
##     }
##   }
## }

