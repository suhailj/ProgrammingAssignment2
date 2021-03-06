## The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to

## set the value of the Matrix
## get the value of the Matrix
## set the value of the Inverse
## get the value of the Inverse

makeCacheMatrix <- function(x=matrix()){
  m<- NULL
  set <- function(y=matrix()){
    x<<-y
    m<<-NULL
  }
  get <- function() x
  setInverse <- function(inverse) m<<- inverse
  getInverse <- function() m
  list(set=set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## The following function calculates the Inverse of the special "matrix" created with the above function. 
## However, it first checks to see if the matrix has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setInverse function.
## For this assignment, assume that the matrix supplied is always invertible.

cacheSolve <- function(x, ...) {
  m <<- x$getInverse()
  if(!is.null(m))
  {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m<- solve(data , ... )
  x$setInverse(m)
  m
}
