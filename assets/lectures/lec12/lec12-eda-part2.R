## ----setup, include=FALSE------------------------------------------------
options(width = 60)
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ---- echo = F, message=F, cache = FALSE---------------------------------
library("magrittr")
library("lattice")
library("ggplot2")

## ---- fig.height=5-------------------------------------------------------
plot(NULL, xlim=c(0,1), ylim=c(0,1), 
     ylab="Y Axis label", xlab="X Axis label")

## ----echo = -c(1:3), fig.height=4----------------------------------------
plot(NULL, xlim=c(0,1), ylim=c(0,1), 
     ylab="Y Axis label", xlab="X Axis label")

set.seed(114)
x = runif(10); y = runif(10)
abline(h = .5)                # Horizontal Line
abline(v = .25, col="purple") # Vertical Line w/ color
points(x, y, pch = 1:10)      # Points w/ shapes
axis(1, .5, LETTERS[1], col.axis = "blue")

## ----too_hot_goldilocks, out.width = "200px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/too_hot_goldilocks.jpg")

## ----eval = FALSE--------------------------------------------------------
## type_of_plot(formula, data=list())

## ------------------------------------------------------------------------
xyplot(mpg ~ disp, data = mtcars)

## ------------------------------------------------------------------------
xyplot(mpg ~ disp|cyl, data = mtcars) # Note the |

## ----too_cold_goldilocks, out.width = "200px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/too_cold_goldilocks.jpg")

## ---- fig.height = 5-----------------------------------------------------
ggplot(mtcars) +               # Supply data.frame
  geom_point(aes(disp, mpg))   # Add points to plot

## ---- fig.height = 5-----------------------------------------------------
ggplot(mtcars) +               # Supply data.frame
  geom_point(aes(disp, mpg)) + # Add points to plot
  facet_wrap(~cyl)             # Write conditioning

## ----just_right, out.width = "200px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/just_right_goldilocks.jpg")

## ----eval = F------------------------------------------------------------
## # install.packages("ggvis")
## library("ggvis")
## mtcars %>% ggvis(~wt, ~mpg) %>% layer_points()

## ----ggvis_scatter_plot, out.width = "200px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/ggvis_mtcars_plot.png")

## ----message = F, warning = F--------------------------------------------
# Extract hospital birth dates
data(births, package="msos")

library("tidyr")
df_births = as.data.frame(births)
df_births$time = seq_len(nrow(df_births))
long_births = gather(df_births, hospital, value, -time)

## ------------------------------------------------------------------------
head(long_births)

## ----long_births, fig.height = 5-----------------------------------------
ggplot(long_births) +       # Initialize ggplot w/ data
  geom_point(               # Add a point layer
    aes(x = time, y = value)# Add an aesthetic mapping
             )

## ----long_births_color, fig.height = 5-----------------------------------
ggplot(long_births) +    # Initialize ggplot w/ data
  geom_point(            # Add a point layer
    aes(x = time,        # Add an aesthetic mapping
        y = value,       
        color = hospital)# Added color
             )

## ----fig.height=4--------------------------------------------------------
g = ggplot(long_births) +   
  geom_point(aes(x = time, y = value))

g

## ----fig.height=4--------------------------------------------------------
(g = g + xlab("Time (hours)") + ylab("Births") + 
  ggtitle("Births vs. Time (hours)"))

## ----fig.height=4--------------------------------------------------------
(g = g + geom_point(aes(x = time, y = value, color = hospital)))


## ----fig.height=4--------------------------------------------------------
(g = g + facet_wrap(~hospital))

## ----fig.height=4--------------------------------------------------------
ggplot(long_births) + 
  geom_histogram(aes(value), binwidth = 1)

## ----fig.height=4--------------------------------------------------------
ggplot(long_births) + 
  geom_histogram(aes(x = value, y = ..density..),
                 binwidth = 1, color = "orange") + 
  geom_density(aes(value), color = "blue")

## ----fig.height=4--------------------------------------------------------
ggplot(long_births, aes(x = value)) +  
  geom_histogram(aes(y = ..density..), # Notice no `x=`
                 binwidth = 1, color = "orange") + 
  geom_density(color = "blue")         # Notice no `x=`

## ----fig.height = 4------------------------------------------------------
ggplot(long_births, aes(x = hospital, y = value)) + 
  geom_boxplot()

## ----fig.height = 4------------------------------------------------------
ggplot(long_births, aes(x = hospital, y = value)) + 
  geom_boxplot() + geom_point()

## ----fig.height = 4------------------------------------------------------
ggplot(long_births, aes(x = hospital, y = value)) + 
  geom_boxplot() + geom_jitter(height = 0, width = 0.4)

## ----fig.height = 4------------------------------------------------------
ggplot(long_births, aes(x = hospital, y = value)) + 
  geom_boxplot() + geom_jitter(height = 0, width = 0.4) + 
  coord_flip()

## ----fig.height = 4------------------------------------------------------
ggplot(long_births, aes(x = hospital, y = value)) + 
  geom_boxplot() + geom_jitter(height = 0, width = 0.4) + 
  coord_flip()

## ----fig.height = 4------------------------------------------------------
ggplot(long_births, aes(x = hospital, y = value)) + 
  geom_boxplot()  + theme_bw()

## ----fig.height = 4------------------------------------------------------
ggplot(long_births, aes(x = hospital, y = value)) + 
  geom_boxplot()  

## ----make_data-----------------------------------------------------------
# Set seed for reproducibility
set.seed(111)

# Generate data
x = runif(100,0,1)

## ----fig.height=4--------------------------------------------------------
qqnorm(x)                  # normal q-q plot
qqline(x,lty=2,col="blue") # line through the Q1 and Q3 quartiles

## ----q_qplot-------------------------------------------------------------
qqn = function(w) {
  n = length(w)
  nv = qnorm((1:n)/(n+1)) # Quantiles of Normal Dist.
  plot(nv, sort(w),       # X,Y
       xlab = "Theoretical Quantiles",
       ylab = "Sample Quantiles")
  title("Normal Q-Q Plot")
  m = (quantile(w,0.75)-quantile(w,0.25))/
      (qnorm(0.75)-qnorm(0.25))
  b = quantile(w,0.25) - m*qnorm(0.25)
  abline(b, m, lty=2, col="red") # Line through Q1 & Q3
}

## ---- fig.height=4-------------------------------------------------------
par(mfrow=c(1,2))     #  Two plots in one window
par(pty="s")          #  Square plots

qqnorm(x)             # Base R first
qqline(x,lty=2,col="blue")

qqn(x)                # Our Plot

## ---- fig.height = 4-----------------------------------------------------
df_x = as.data.frame(x)
n = nrow(df_x)
m = (quantile(x,0.75)-quantile(x,0.25))/
      (qnorm(0.75)-qnorm(0.25))
b = quantile(x,0.25) - m*qnorm(0.25)
g = ggplot(df_x, aes(sample=x)) + 
      stat_qq() +
      geom_abline(intercept = b,
                  slope = m,
                  color = "purple") +
      xlab("Theoretical Quantiles") +
      ylab("Sample Quantiles") +
      ggtitle("Normal Q-Q Plot")

## ---- echo = F-----------------------------------------------------------
g

## ------------------------------------------------------------------------
g + theme_dark() # Welcome to the dark side!

