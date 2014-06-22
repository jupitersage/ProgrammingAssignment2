# This function holds a matrix and its inverse.
#  - Take the input (a,b,c,d) and use it to create a matrix.
#  - If a matrix inverse is provided (via setinverse), then cache the matrix inverse.
makeCacheMatrix <- function(a,b,c,d)
{
  # Initialize the matrix inverse variable, and store the matrix
  mi <- NULL
  m <- matrix( c(a,b,c,d), nrow=2, ncol=2, byrow=TRUE )
  
  # Return the matrix
  get <- function() m
  
  # Return the matrix inverse
  getinverse <- function() mi
  
  # Cache the matrix inverse
  setinverse <- function(inverse) mi <<- inverse
  
  # List of defined functions
  list(get = get,
       getinverse = getinverse,
       setinverse = setinverse)
}



# NOTE: See below for example execution.

# Retrieve and return a matrix inverse if the inverse is cached.
# Otherwise if inverse is not yet cached then calculate the matrix inverse,
# and then cache the inverse and return it.
cacheSolve <- function(mCM)
{
  mtrx_inverse <- mCM$getinverse()	
  if ( is.null(mtrx_inverse) )
  {
    inverse <- solve( mCM$get() )
    mCM$setinverse(inverse)
    print("Calculated inverse:")
    return(inverse)
  }
  else
  {
    print("Cached inverse:")
    return(mtrx_inverse)
  }
}

# Example Execution
# ---------------------------------
# > source("makeCacheMatrix.R")
# > source("cacheSolve.R")
# > mCM <- makeCacheMatrix(1,2,3,4)
# > mCM$get()
#      [,1] [,2]
# [1,]    1    2
# [2,]    3    4
# > cacheSolve(mCM)
# [1] "Calculated inverse:"
#        [,1] [,2]
# [1,] -2.0  1.0
# [2,]  1.5 -0.5
# > cacheSolve(mCM)
# [1] "Cached inverse:"
#        [,1] [,2]
# [1,] -2.0  1.0
# [2,]  1.5 -0.5
# > cacheSolve(mCM)
# [1] "Cached inverse:"
#        [,1] [,2]
# [1,] -2.0  1.0
# [2,]  1.5 -0.5
# > mCM <- makeCacheMatrix(5,10,15,20)
# > mCM$get()
#        [,1] [,2]
# [1,]    5   10
# [2,]   15   20
# > cacheSolve(mCM)
# [1] "Calculated inverse:"
#        [,1] [,2]
# [1,] -0.4  0.2
# [2,]  0.3 -0.1
# > cacheSolve(mCM)
# [1] "Cached inverse:"
#        [,1] [,2]
# [1,] -0.4  0.2
# [2,]  0.3 -0.1
# > cacheSolve(mCM)
# [1] "Cached inverse:"
#        [,1] [,2]
# [1,] -0.4  0.2
# [2,]  0.3 -0.1
# > 
# ---------------------------------
