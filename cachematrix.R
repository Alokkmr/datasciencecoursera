## makeCacheMatrix stores the function in a separate environment. 
## cachesolve searches that environment for function value (m)
## If no strored value is found it uses solve function
## Then prints the output and also sends the value to makeCacheMatrix

## Takes the data x. Stores x in function get. Stores the m(inverse) 
## in setsolv. Stores m() in getsolve. makeCacheMatrix() makes a 
## separate environment for each x.

makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      get <- function() x
      setsolv <- function(solv) m <<- solv
## m<<-solv stores solv in a different environment
## every variable in a function gets deleted after operation
## m<-solve would be deleted after makeCacheMatrix closes
      getsolv <- function() m
      list(get = get, setsolv = setsolv, getsolv = getsolv)
}


##Searches the value in get$solv. If there is a non null value
##breaks the if structure and returns m. Tn case of null value
##uses solve to get inverse. sets the value in makeCacheMatrix

cacheSolve <- function(x, ...) {
      m <- x$getsolv()
      if(!is.null(m)){
          message("Getting cached data")
          return(m)
      }
      dat <- x$get()
      m <- solve(dat, ...)
      x$setsolv(m)
      m
## m is inverse of matrix x. Prints it and stores it in cache
## only works for a 2x2 matrix 
}
