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
