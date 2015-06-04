#' Block rearrangement algorithm
#'
#' Function which performs the block ra of Bernard and McLeish
#'
#' @param X numeric array or matrix
#' @param epsilon target variance of row sums is epsilon multiplied by the mean of the matrix variances
#' @param shuffle randomly permute each column of the matrix before rearrangement
#'
#' @return numeric matrix with a minimal row sum variance
#'
#' @export
#'
#' @seealso The \code{\link{ra}} for the rearrangement algorithm
#'
#' @references \url{LINK TO RA PAPER}
#'
#' @author Kris Boudt, \email{kris.boudt@@vub.ac.be}
#' @author Steven Vanduffel, \email{steven.vanduffel@@vub.ac.be}
#' @author Kristof Verbeken, \email{kristof.verbeken@@vub.ac.be}
blockra <- function(X, epsilon = 0.1, shuffle = TRUE) {
  if (shuffle) {
    X <- X(matrix, 2, sample)
  }

  var.new   <- var(rowSums(X))
  var.old   <- 2 * var.new
  target    <- epsilon * mean(apply(X, 2, var))

  while ((var.new > target) && (var.new < var.old)) {

    partition <- sample(0 : 1, ncol(X), replace = TRUE)
    X         <- rearrangepartition(X, partition)
    var.old   <- var.new
    var.new   <- var(rowSums(X))
  }

  return(X)
}
