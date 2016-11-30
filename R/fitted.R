fitted.btfit <- function(btfit){
  if (!inherits(btfit, "btfit")) stop("Argument should be a 'btfit' object")

  pi <- btfit$pi
  N <- btfit$N
  diagonal <- btfit$diagonal


  if (is.list(pi)) {
    my_fitted <- function(pi, N) {
      p <- btprob_vec(pi)
      p * N
    }

    out <- Map(my_fitted, pi, N)

    my_diag <- function(x,y) {
      diag(x) <- y
      return(x)
    }

    out <- Map(my_diag, out, diagonal)

  }

  else {
    p <- btprob_vec(pi)
    out <- p * N
    diag(out) <- diagonal
  }

  return(out)

  # need to take care of diagonal

}