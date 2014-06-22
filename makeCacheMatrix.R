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
