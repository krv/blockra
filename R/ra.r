#' Rearrangement Algorithm
#'
#' Function which performs the traditional RA
#'
#' @param X numeric array or matrix
#' @param epsilon target variance of row sums is epsilon multiplied by the mean of the matrix variances
#' @param shuffle randomly permute each column of the matrix before rearrangement
#' @param fix.first don't change the order of the first column
#' @param obj objective function that is minimized, default is variance
#' @param seed random seed
#'
#' @return numeric matrix with a minimal row sum variance
#'
#' @export
#'
#' @seealso \code{\link{blockra}} for the block rearrangement algorithm
#' @seealso \code{\link{brave}} for the block rearrangement variance equalizer
#'
#' @references \url{LINK TO RA PAPER}
#'
#' @author Kris Boudt, \email{kris.boudt@@vub.ac.be}
#' @author Steven Vanduffel, \email{steven.vanduffel@@vub.ac.be}
#' @author Kristof Verbeken, \email{kristof.verbeken@@vub.ac.be}
ra <- function(X, epsilon = 0.1, shuffle = TRUE, fix.first = TRUE, obj = var, seed = 1) {
  set.seed(1)
  if (shuffle) X <- shufflematrix(X, fix.first)

  obj.new    <- obj(rowSums(X))
  obj.old    <- 2 * obj.new
  obj.target <- epsilon * mean(apply(X, 2, obj))

  while ((obj.new > obj.target) && (obj.new < obj.old)) {

    for (col in 1 : ncol(X)) {
      current         <- sort(X[, col])
      other.sums      <- rowSums(X[ , -col])
      other.sums.rank <- rank(-other.sums, ties.method = "random")
      X[, col]        <- current[other.sums.rank]
    }
    obj.old   <- obj.new
    obj.new   <- obj(rowSums(X))
  }

  return(X)
}
