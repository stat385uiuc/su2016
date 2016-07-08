h = read.table(text="x,y
140.26,18.76
               103.88,51.4
               74.62,6.66
               118.59,44.76
               102.64,49.9
               116.33,24.48
               112.58,63.9
               92.17,96.96
               131.98,58.61
               116.64,51.19",sep=",", header = T)


#' Read in data
#' Need to specify a filepath
#' @param path A \code{string} that contains the file path.
read.coords = function(path = "coords.csv"){
  read.csv(path)
}

#' Calculate coords
#' @param input  An input set of (x_0,y_0)
#' @param origin A coordinate point (x,y)
calc_coords = function(input, origin = cbind(0,0)){
  structure(
    sqrt((input[,1] - origin[,1])^2 + (input[,2] - origin[,2])^2),
    class = c("coords","matrix"))
}

#' @param x      Distance
#' @param coords Pair of x & y coordinates
#' @param top_p  Number of Top coordinates to highlight
summary.coords = function(x, coords, top_p = 5, ... ){
  
  # Find the number of coordinates top_p
  top_coords = which(x %in% sort(x)[seq_len(top_p)])
  
  class(x) = "numeric"
  
  o = list(summary_x = summary(x), # six number summary
           top_p = top_p,          # number of coordinates to select
           coords_numeric = x[top_coords],
           highlight = coords[top_coords,],
           coords = coords         # List of coordinates
  )
  
  class(o) = "summary_coords"
  
  return(o)  
}

#' Plot the data with nearest points
#' @param x A \code{summary_coords} object.
plot.summary_coords = function(x, ...){
  
  # How could I only plot x coordinates?
  plot(x$coords[,1], x$coords[,2])
  points(x$highlight, col = "red")
}

## Run through of the code

# Calculate the distance

distances = calc_coords(h)

m = summary(distances,h)

plot(m)
