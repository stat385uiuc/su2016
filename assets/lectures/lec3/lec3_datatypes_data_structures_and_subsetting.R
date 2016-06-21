## ----default_menu, out.width = "100px", fig.retina = NULL, fig.align='center', echo = F, cache = T----
knitr::include_graphics("figures/menu.png")

## ----default_rstudio, out.width = "200px", fig.retina = NULL, fig.align='center', echo = F, cache = T----
knitr::include_graphics("figures/default_rstudio.png")

## ------------------------------------------------------------------------
isTRUE

## ----shape_game, out.width = "150px", fig.retina = NULL, fig.align='center', echo = F, cache = T----
knitr::include_graphics("figures/shape_game.jpg")

## ------------------------------------------------------------------------
a = 1     # Assign 1 to `a`
b = 2     # Assign 2 to `b`

d = a + b # Assign the sum of `a` and `b` to `d`.

## ------------------------------------------------------------------------
NA            # Logical

NA_integer_   # Integer

NA_real_      # Double

NA_character_ # Character

## ------------------------------------------------------------------------
LETTERS     # Uppercase alphabet
letters     # Lowercase alphabet

## ------------------------------------------------------------------------
month.abb   # Abbreviated Month Name
month.name  # Full Month Name
pi          # Pi 

## ------------------------------------------------------------------------
pi        # Initial Value
pi = 3.14 # Modified the equation
pi        # View new value

## ------------------------------------------------------------------------
life = 42
life

## ------------------------------------------------------------------------
(life = 42)

## ------------------------------------------------------------------------
x = 1  # Good

x <- 1 # Bad

## ------------------------------------------------------------------------
a = numeric()   # Numeric
b = integer()   # Integer
d = character() # String
e = complex()   # Complex Number
f = logical()   # Boolean
g = factor()    # Factor

## ------------------------------------------------------------------------
length(a) # Number of elements contained in the vector

## ------------------------------------------------------------------------
n = 20L         # Store a number
a = numeric(n)  # Create a double
a               # View entries
length(a)       # Verify the length

## ------------------------------------------------------------------------
(a2 = c(-1,2,4,5,1,6,41,31,23))
(b2 = c(1L,2L,3L))

## ------------------------------------------------------------------------
c(1, c(2, c(3, 4)))  # Nested concatenation

c(1, 2, 3, 4)        # Traditional construction

## ------------------------------------------------------------------------
typeof(a)        # Determine the type of `a`
typeof(b2)       # Determine the type of `b2`

## ------------------------------------------------------------------------
attributes(a)     # Access metadata of `a`

## ------------------------------------------------------------------------
# Set metadata of `a` to include parameter sample with value statistics
attr(a,"sample") = "Statistics" 
attributes(a)      # Access metadata of `a`

## ----eval = F------------------------------------------------------------
## is.character(letters) # Checks for characters
## is.double(1.2:4.4)    # Check for doubles
## is.integer(1L:4L)     # Checks for integers
## is.logical(c(T,F))    # Checks for booleans
## is.atomic(1:4)        # Checks for atomic vector

## ------------------------------------------------------------------------
a = runif(5)      # Five random numbers from within [0,1]
b = letters[1:5]  # First 5 letters of the alphabet

## ------------------------------------------------------------------------
str(a)            # View the structure of `a`

str(b)            # View the structure of `b`

## ------------------------------------------------------------------------
d = c(a, b)       # Concatenate `a` and `b`

str(d)            # View the structure of `d`

## ------------------------------------------------------------------------
(x = c(TRUE, FALSE, FALSE, TRUE))
as.numeric(x)


## ------------------------------------------------------------------------
a[1]     # Access and print first element

a[1] = 2 # Accesss and assign new value to first element

a[1]     # Access and print first element

## ------------------------------------------------------------------------
x = c("sphynx" = -1, "calypso" = 2, "doomsday" = 0, 
      "life" = 42, "nine" = 9)

## ------------------------------------------------------------------------
x[c("doomsday", "life")]

## ------------------------------------------------------------------------
names(x)

## ------------------------------------------------------------------------
x[c(2, 4)]

## ------------------------------------------------------------------------
x[-c(2, 4)]

## ---- eval = F-----------------------------------------------------------
## x[-c("doomsday", "life")]
## # Error in -c("doomsday", "life") :
## # invalid argument to unary operator

## ------------------------------------------------------------------------
x[]   # All terms

## ------------------------------------------------------------------------
x[0]  # Empty Vector

## ------------------------------------------------------------------------
x[9]  # Only one NA returned

x[NA] # All terms are NA

## ------------------------------------------------------------------------
x[order(x)]                   # Ascending Order

x[order(x, decreasing = T)]   # Descending Order

## ------------------------------------------------------------------------
sort(x)

## ------------------------------------------------------------------------
2 * x       # Multiply all values by two

x / 3       # Divide all values by three

x + 1       # Add one to all values.

2 * (x - 1) # Subtract one from all values and then multiply by 2

## ------------------------------------------------------------------------
x = 1:5                  # Create initial vector
sumx = 0                 # Create a sum value

for(i in seq_along(x)){  # Create an index vector
   sumx = sumx + x[i]    # Access each [i] and sum over it
}

## ------------------------------------------------------------------------
sumx_v2 = sum(x)         # Use a vectorized calculation

## ------------------------------------------------------------------------
all.equal(sumx, sumx_v2) # Verify equality

## ------------------------------------------------------------------------
# Generates a vector of length `5` that contains only 1
rep(1,5)

## ------------------------------------------------------------------------
# Generates a vector of length `5` that contains 1, 2, 3, ... , 5
seq(1,5)

## ------------------------------------------------------------------------
# Generates a vector of length `10` containing 0.0, 0.1, ..., 1.0
seq(0, 1, by = 0.1)

## ------------------------------------------------------------------------
y = c(1,5,6,2,4) # Create a vector
n = length(y)    # Obtain the Length

## ------------------------------------------------------------------------
# Generates a vector starting at `1` and going to `n`.
seq_len(n)

## ------------------------------------------------------------------------
# Generates a vector starting at `1` and 
# going to `length(y)`. 
seq_along(y)

## ------------------------------------------------------------------------
x         # Original
c(-1,1)*x # Recycled values of x

