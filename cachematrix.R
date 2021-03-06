## Put comments here that give an overall description of what your functions do
## Caching the Inverse of a Matrix

## Write a short comment describing this function
## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
    ## Initialize the inverse property
    inv <- NULL

    ## Method to set the matrix
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }

    ## Method the get the matrix
    get <- function() x

    ## Method to set the inverse of the matrix
    setInverse <- function(inverse) inv <<- inverse

    ## Method to get the inverse of the matrix
    getInverse <- function() inv

    ## Return a list of the methods
    list(
        set = set,
        get = get,
        setInverse = setInverse,
        getInverse = getInverse
    )

}

## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getInverse()

    ## Just return the inverse if its already set
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }

    ## Get the matrix from our object
    data <- x$get()

    ## Calculate the inverse using matrix multiplication
    inv <- solve(data, ...)

    ## Set the inverse to the object
    x$setInverse(inv)

    ## Return the matrix
    inv
}
