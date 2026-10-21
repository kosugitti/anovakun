# Test data in the wide format expected by anovakun: one label column per
# between-subjects factor, then one column per within-subjects cell.
# `n` gives the number of subjects per between-subjects cell (recycled), so
# unequal values make an unbalanced design.
make_wide <- function(design, levels, n = 4, seed = 123, missing = 0) {
  set.seed(seed)
  spos <- match("s", strsplit(design, "")[[1]])
  betlev <- levels[seq_len(spos - 1)]
  withlev <- levels[-seq_len(spos - 1)]
  ncell <- if (length(withlev)) prod(withlev) else 1

  if (length(betlev)) {
    cells <- expand.grid(rev(lapply(seq_along(betlev), function(i)
      paste0(letters[i], seq_len(betlev[i])))), stringsAsFactors = FALSE)
    cells <- cells[, rev(seq_along(betlev)), drop = FALSE]
    n <- rep_len(n, nrow(cells))
    lab <- cells[rep(seq_len(nrow(cells)), n), , drop = FALSE]
    shift <- rep(seq_len(nrow(cells)), n) * 0.7
  } else {
    lab <- NULL
    shift <- rep(0, n[1])
  }
  nsub <- length(shift)

  # Subject effects, cell effects and heteroscedastic noise, so that the
  # sphericity tests and corrections have something to work on.
  subj <- rnorm(nsub, sd = 2)
  cell <- seq_len(ncell) * 0.5
  noise <- sapply(seq_len(ncell), function(j) rnorm(nsub, sd = 0.5 + 0.4 * j))
  y <- round(10 + shift + outer(subj, rep(1, ncell)) +
               outer(rep(1, nsub), cell) + noise, 1)
  y <- matrix(y, nrow = nsub)
  if (missing > 0) y[cbind(seq_len(missing) * 2, 1)] <- NA

  ydf <- as.data.frame(y)
  names(ydf) <- paste0("y", seq_len(ncell))
  if (is.null(lab)) ydf else cbind(lab, ydf, row.names = NULL)
}

# Long format: subject, factors, value.
make_long <- function(design, levels, n = 4, seed = 123) {
  wide <- make_wide(design, levels, n, seed)
  spos <- match("s", strsplit(design, "")[[1]])
  betlen <- spos - 1
  withlev <- levels[-seq_len(betlen)]
  nsub <- nrow(wide)
  wcells <- if (length(withlev)) {
    g <- expand.grid(rev(lapply(seq_along(withlev), function(i)
      paste0(letters[betlen + i], seq_len(withlev[i])))), stringsAsFactors = FALSE)
    g[, rev(seq_along(withlev)), drop = FALSE]
  } else NULL
  ncell <- ncol(wide) - betlen
  out <- do.call(rbind, lapply(seq_len(ncell), function(j) {
    d <- data.frame(s = paste0("s", seq_len(nsub)))
    for (i in seq_len(betlen)) d[[LETTERS[i]]] <- wide[[i]]
    for (i in seq_along(withlev)) d[[LETTERS[betlen + i]]] <- wcells[j, i]
    d$y <- wide[, betlen + j]
    d
  }))
  rownames(out) <- NULL
  out
}

# Designs used throughout the tests.
designs <- list(
  As       = list(design = "As",   levels = c(3),       n = 5),
  As_unb   = list(design = "As",   levels = c(3),       n = c(4, 6, 5)),
  sA       = list(design = "sA",   levels = c(4),       n = 8),
  AsB      = list(design = "AsB",  levels = c(2, 3),    n = 5),
  AsB_unb  = list(design = "AsB",  levels = c(2, 3),    n = c(4, 6)),
  sAB      = list(design = "sAB",  levels = c(2, 3),    n = 8),
  ABs      = list(design = "ABs",  levels = c(2, 3),    n = 4),
  ABs_unb  = list(design = "ABs",  levels = c(2, 3),    n = c(3, 5, 4, 4, 6, 3)),
  AsBC     = list(design = "AsBC", levels = c(2, 2, 3), n = 5),
  ABsC     = list(design = "ABsC", levels = c(2, 3, 2), n = c(3, 4, 3, 5, 4, 3)),
  ABCs     = list(design = "ABCs", levels = c(2, 2, 2), n = 3),
  sABC     = list(design = "sABC", levels = c(2, 2, 3), n = 8)
)

design_args <- function(d, ...) {
  c(list(make_wide(d$design, d$levels, d$n), d$design), as.list(d$levels), list(...))
}
