## ----setup, include=FALSE------------------------------------------------
options(width = 60)
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ---- echo = F, message=F, cache = FALSE---------------------------------
library("magrittr")
library("ggplot2")

## ------------------------------------------------------------------------
# Make some data
n = 20

# Set seed for reproducibility
set.seed(1133)
d = data.frame(id = paste0("s",sample(1:n, n)),
               sex = sample(c("male","female"), 
                            n, replace = T),
               food = sample(c("cake","pie"),
                             n, replace = T),
               trt_a = runif(n),
               trt_b = rnorm(n)
               )

## ----verify_head---------------------------------------------------------
head(d)        # Defaults to showing the first 6 

head(d, n = 2) # Shows the first 2 

## ----verify_tail---------------------------------------------------------
tail(d)        # Defaults to showing the last 6 

tail(d, n = 2) # Shows the last 2 

## ----verify_obs_and_vars-------------------------------------------------
nrow(d)  # Find the number of observations
ncol(d)  # Find the number of variables 
dim(d)   # Both observations and variables (n x p)

## ----verify_data_types---------------------------------------------------
sapply(d, FUN=class)   # Obtain each columns data type

## ----verify_missing_sum_func---------------------------------------------
# Count number of missing values
sum_na = function(x){
  sum(is.na(x))
}

## ----verify_missing_sum_overview-----------------------------------------
sapply(d, FUN=sum_na)   # Missing values per column

## ----numeric_5-----------------------------------------------------------
stat5summary = function(x, na.rm = T){
  if(class(x) != "numeric") 
    stop("`x` must be numeric data")
  
  # Calculate quantiles
  q = quantile(x, probs = c(0.25, 0.5, 0.75),
               na.rm = na.rm)

  # Return
  c("min" = min(x, na.rm = na.rm),
    "q1" = q[[1]], "median" = q[[2]], "q3" = q[[3]], 
    "max" = max(x, na.rm = na.rm))
}

## ----numeric_5_call------------------------------------------------------
sapply(d[,4:5], FUN = stat5summary) 

## ----numeric_5_call_summary----------------------------------------------
sapply(d[,4:5], FUN = summary) 

## ----category_count------------------------------------------------------
sapply(d[,1:3], FUN = summary) 

## ----category_table------------------------------------------------------
(o = table(d[,2], d[,3]))

## ----category_percentages------------------------------------------------
prop.table(o)  # Requires table() object

## ----category_table_error------------------------------------------------
head(table(d[,1], d[,2]))

## ----sample_data---------------------------------------------------------
set.seed(2016) # Set Seed for reproducibility
n = 1e4        # Number of observations

(n*2) %>%      # Generate some data
  rnorm %>%
  matrix(ncol = 2) -> a

runif(n, 0, 2 * pi) %>%
  {0.5 * cbind(sin(.), cos(.))} -> b
  
o = rbind(a,b)   # Combine generate data

x = as.data.frame(o[sample(nrow(o)), ])

colnames(x) = c("x","y")

## ----sample_data_summary-------------------------------------------------
summary(x)    # data.frame implements summary.

## ----ggplot_exploratory--------------------------------------------------
ggplot(x) + geom_point(aes(x,y))

## ----ggplot_exploratory_redux--------------------------------------------
ggplot(x) + geom_point(aes(x,y), alpha = 0.05)

## ----base_r_exploratory, fig.height = 5----------------------------------
plot(x, col = rgb(0, 0, 0, 0.05)) # Transparent color

