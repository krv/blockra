#' Inversely sort a block based on the order of a bigger block
#'
#' @param block1 the small block to be inversely rearranged
#' @param block2 the large block
#' @return rearranged first block
#' @export
#' @examples
#' rearrange(block1, block2)
rearrange <- function(block1, block2) {

  if (is.matrix(block1)) {
    block1.rows <- nrow(block1)
    block1.sums <- rowSums(block1)
  } else if (is.vector(block1)) {
    block1.rows <- length(block1)
    block1.sums <- block1
  } else {
    stop("block 1 is not a matrix or vector")
  }

  if (is.matrix(block2)) {
    rank.block2 <- rank(rowSums(block2), ties.method= "first")
  } else if (is.vector(block2)) {
    rank.block2 <- rank(block2, ties.method = "first")
  } else {
    stop("block 2 is not a matrix or vector")
  }

  rank.target <- (block1.rows + 1) - rank.block2
  index.initial <- sort(block1.sums, index.return = TRUE)$ix

  if (is.matrix(block1)) {
    block1 <- block1[index.initial[rank.target], ]
  } else {
    block1 <- block1[index.initial[rank.target]]
  }

  return(block1)
}
