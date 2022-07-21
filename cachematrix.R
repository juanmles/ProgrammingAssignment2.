## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##
## I set the input x as a matrix
## and set the solved value "s" as a null
## then I changed every reference "mean" to "solve"

makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) { ## define the argument with default mode of "matrix"
  s <- NULL ## initialize s as NULL; will hold value of matrix
  set <- function(y) { ## define the set function to assign new 
    x <<- y ## value of matrix in parent environment
    s <<- NULL ## if there is a new matrix, reset s to NULL
  }
  get <- function() x ## define the get fucntion - returns value of the matrix argument
  setsolve <- function(solve) s <<- solve ## assigns value of solve in parent environment
  getsolve <- function() s ## gets the value of solve where called
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve) ## you need this in order to refer to the functions with the $ operator
}
##makeCacheMatrix is a function which creates a special "matrix" object that can 
##cache its inverse for the input (which is an invertible square matrix)
## Same here, changed "mean" to "solve" and "m" to "s"
cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting inversed matrix")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
##cacheSolve is a function which computes the inverse of the special "matrix"
##returned by makeCacheMatrix above. If the inverse has already been calculated
##(and the matrix has not changed), then the cachesolve should retrieve the
##inverse from the cache


