
## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  d <- NULL
  set <- function(y) {
    x <<- y
    d <<- NULL
  }
  get <- function() x
  setdata <- function(data) d <<- data # calculate the inverse
  getdata <- function() d
  list(set = set,
       get = get,
       setdata = setdata,
       getdata = getdata)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  
  d <- x$getdata()
  if (!is.null(d)) {
    message("getting cached data")
    return(d)
  }
  data <- x$get()
  d <- solve(data, ...)
  x$setdata(d)
  d
  
}


C <- matrix(c(1,2,3,4),2,2)
#this function can?t happen

C1 <- makeCacheMatrix(C)
cacheSolve(C1) #inverse returned after computation

cacheSolve(C1) #inverse returned from cache
