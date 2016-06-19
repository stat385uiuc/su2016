## @knitr loadpackages
# Any package that is required by the script below is given here:
inst_pkgs = load_pkgs =  c("rbenchmark","microbenchmark","compiler","ggplot2")
inst_pkgs = inst_pkgs[!(inst_pkgs %in% installed.packages()[,"Package"])]
if(length(inst_pkgs)) install.packages(inst_pkgs)

# Dynamically load packages
pkgs_loaded = lapply(load_pkgs, require, character.only=T)

## @knitr enrollment_data

d = data.frame(Major = c("Statistics", "Mechanical Engineering","Psychology/Statistics","Economics/Statistics","Statistics","Psychology","Economics/Statistics","Business Administration","General Curriculum","Neuroscience","Statistics"),
               Standing  = c("Senior", "Graduate", "Senior", "Senior","Senior","Senior","Junior","Graduate","Senior","Graduate","Senior"), stringsAsFactors = F)

d$Standing = factor(d$Standing, levels=c("Graduate","Senior","Junior"))

## @knitr enrollment_level
ggplot(d) + geom_bar(aes(Standing)) + ylab("Frequency") + ggtitle("Class Standing")

## @knitr enrollment_major
ggplot(d) + geom_bar(aes(Major)) + 
  ylab("Frequency") + ggtitle("Area of Study") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


## @knitr sample_r_storing
# Create numeric object with values
x = 3 
y = 5

# Perform calculations
x + y
x - y

# x*y; x/y; x^y;

## @knitr sample_r_vectors
x = c(1,2,3,4,5) # Create vector
y = 6:10         # Shorthand

cbind(x, y)      # Combine Columns to form Matrix: 5 x 2

rbind(x, y)      # Combine Rows to form Matrix: 2 x 5


## @knitr sample_r_functions
x = seq(1, 10, by = 2)   # 1, 3, 5, 7, 9
y = seq(10, 30, by = 5)  # 10, 15, .. , 30

result = numeric(1)      # Storage
for(i in 1:length(x)){   # (variable in sequence)
  result = x[i] + result
}                        # Loop (slow)

(out = sum(x))           # Vectorized Function (faster)
all.equal(result, out)   # Same value
#sd(x)                   # Standard Deviation
#cor(x,y)                # Correlation
#cov(x,y)                # Covariance

## @knitr bad_loop
bad.loop = function(){
  sum = 0
  for(i in 1:1000){
    a = 1/sqrt(2) # In loop
    sum = (sum+i)*a
  }
  sum
}

## @knitr good_loop
good.loop = function(){
  sum = 0
  a = 1/sqrt(2) # Out of Loop
  for(i in 1:1000){
    sum = (sum+i)*a
  }
  sum
}

## @knitr benchmark_loop
kable(benchmark(good.loop(), bad.loop(), columns = c("test", "replications", "elapsed", "relative", "user.self", "sys.self"), order="relative"))

## @knitr compiler_ex
good.comp = cmpfun(good.loop)
disassemble(good.comp)

## @knitr compiler
library("compiler")
good.comp = cmpfun(good.loop)
bad.comp = cmpfun(bad.loop)

## @knitr compiler_bench
kable(benchmark(good.comp=good.comp(), bad.comp=bad.comp(), good.loop = good.loop(), bad.loop = bad.loop(), columns = c("test", "replications", "elapsed", "relative", "user.self", "sys.self"), order="relative"))