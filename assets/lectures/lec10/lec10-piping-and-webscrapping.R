## ----setup, include=FALSE------------------------------------------------
options(width = 60)
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ---- echo = F, message=F, cache = FALSE---------------------------------
library("magrittr")

## ----stepwise_read, eval = FALSE-----------------------------------------
## input_data = read.csv('/path/to/data.csv')
## subset_data = subset(input_data, treatment > 10)
## top_20_data = head(subset_data, 20)

## ----embedded_call, eval = FALSE-----------------------------------------
## top_20_data = head(
##                    subset(
##                           read.csv('/path/to/data.csv'),
##                           treatment > 10),
##                  20)

## ----compressed_r_starbucks, eval = FALSE--------------------------------
## pickup(goto(store(drink("Java Chip Frap"),
##                   loc="Green St.")))

## ----javachip_frap, eval = FALSE-----------------------------------------
## "Java Chip Frap" %>% drink %>%
##   store(loc="Green St.") %>%
##   goto %>%
##   pickup

## ----embedded_call_r, eval = FALSE---------------------------------------
## top_20_data = head(
##                    subset(
##                           read.csv('/path/to/data.csv'),
##                           treatment > 10),
##                  20)

## ----embedded_call_pipe, eval = FALSE------------------------------------
## read.csv('/path/to/data.csv') %>%
##   subset(treatment > 10) %>%
##   head(20) -> top_20_data

## ----smore_bunny_foo_foo, out.width = "220px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/bunny_foo_foo.jpg")

## ----simulated_data------------------------------------------------------
# Set Seed for Reproducibility
set.seed(1123)

# Generate Data
d = data.frame(x=rnorm(10), y = rnorm(10))

## ----pipe_breakage_function, cache = TRUE, eval = FALSE------------------
## myfunc = function(other_param, x)

## ----pipe_breakage, cache = TRUE-----------------------------------------
# Moved `d` to the data argument
d %>% lm(y ~ x, data = .) 

## ----pipe_breakage_subset, cache = TRUE----------------------------------
d %>% .[["y"]]

## ----fig.width=6, fig.height=3-------------------------------------------
d %>%
as.matrix %T>%
plot %>% # plot will not return anything
colSums  # as.matrix goes into colSums.

## ----pipe_op_rstudio, out.width = "250px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/pipe_op_rstudio.png")

## ----pipe_op, out.width = "250px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/MagrittePipe.jpg")

## ----eval = F------------------------------------------------------------
## tail(subset(iris, Petal.Width > mean(Petal.Width)))

## ----pipe_string, eval = F-----------------------------------------------
## a = "stat 385 is evolving"
## b = "My pokemon is evolving faster..."

## ----eval = F, engine='html'---------------------------------------------
## <!DOCTYPE html>
## <html>
## <head>
## <title>Title of Page</title>
## </head>
## <body>
## 
## <h1 align = "center">First order heading (large)</h1>
## <p>Paragraph for text with a
##    <a href="http://www.stat.illinois.edu">link!</a>
## </p>
## 
## <!-- Comment -->
## 
## </body>
## </html>

## ----eval = F, engine = 'html'-------------------------------------------
## <tag>content</tag>

## ----eval = F, engine = 'html'-------------------------------------------
## <b>some text that I want bold</b>

## ----eval = F, engine = 'html'-------------------------------------------
## <tag attribute="property">content</tag>

## ----eval = F, engine = 'html'-------------------------------------------
## <a href="http://illinois.edu">UIUC Website</a>

## ----chrome_dev, out.width = "300px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/chrome_dev.png")

## ----chrome_dev_webbar, out.width = "400px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/webdev_bar.png")

## ----chrome_dev_selector, out.width = "300px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/get_selector.png")

## ----css_selector_phd, eval = FALSE, engine='html'-----------------------
## #content > ul > li:nth-child(1) > a

## ----css_selector_phd_reduced, eval = FALSE, engine='html'---------------
## #content > ul > li > a

## ----cache = F-----------------------------------------------------------
# Load the Package
library("rvest")

## ----phd_directory-------------------------------------------------------
# Grab a copy of the PhD Directory
phds = read_html(
  "http://www.stat.illinois.edu/people/grad.shtml")
 
# Get a list of PhD Names
phds %>% 
  # Uses selector given before
  html_nodes("#content > ul > li > a") %>% 
  html_text() -> phd_names
 
phd_names %>% .[[1]]

## ----netids_phd----------------------------------------------------------
# Get a list of PhD Names
phds %>% 
  # Uses selector given before
  html_nodes("#content > ul > li > a") %>% 
  # Get the linking information
  html_attr("href") %>% 
  # Remove everything prior to the directory call
  gsub(".*www/","", .) -> phd_netids
 
phd_netids %>% .[[1]] # Pop the first ID

## ----user_session--------------------------------------------------------
# Similar to the `read_html`
coatless = html_session("http://github.com/coatless")

# Notice I'm resaving into `coatless`
coatless %>% 
  follow_link("thecoatlessprofessor") -> coatless

# Go back to GitHub (not saved)
coatless %>% back() 

## ----user_session_v2-----------------------------------------------------
# Go to one of the repositories
coatless  %>% back()  %>% follow_link("@SMAC-Group")

