# Load the unmodified original source of ANOVA-kun (inst/original/) into its
# own environment, so that the packaged functions can be checked against it.
original_file <- function() {
  f <- list.files(system.file("original", package = "anovakun"),
                  pattern = "^anovakun_[0-9]+\\.txt$", full.names = TRUE)
  if (length(f) != 1) stop("Expected exactly one original source in inst/original/.")
  f
}

orig <- new.env(parent = globalenv())
sys.source(original_file(), envir = orig, keep.source = FALSE,
           toplevel.env = orig)

# Run a function, returning either its value or the error message.
run_or_error <- function(f, args, seed) {
  set.seed(seed)
  tryCatch(do.call(f, args), error = function(e) structure(conditionMessage(e), class = "run_error"))
}

# Returned value, with the printed output discarded.
run_value <- function(f, args, seed) {
  utils::capture.output(res <- run_or_error(f, args, seed))
  res
}

# Printed output with the lines holding the execution date and time removed.
printed <- function(f, args, seed) {
  out <- utils::capture.output(res <- run_or_error(f, args, seed))
  if (inherits(res, "run_error")) return(res)
  out[!grepl("It was executed on|secs elapsed", out)]
}

# The packaged function and the original must give identical results,
# both as the technical output (tech = TRUE) and as printed tables.
# anovatan() discards the results of tech = TRUE, so `tech = FALSE` skips
# that comparison.
expect_same_as_original <- function(fun, args, seed = 1, tech = TRUE) {
  new_f <- getExportedValue("anovakun", fun)
  old_f <- get(fun, envir = orig)

  if (tech) {
    targs <- c(args, list(tech = TRUE))
    new_t <- run_or_error(new_f, targs, seed)
    old_t <- run_or_error(old_f, targs, seed)
    if (is.list(new_t)) new_t$INFORMATION <- NULL
    if (is.list(old_t)) old_t$INFORMATION <- NULL
    expect_identical(new_t, old_t)
  }

  # Returned value of the printed call (e.g. data.frame = TRUE).
  expect_identical(run_value(new_f, args, seed), run_value(old_f, args, seed))
  expect_identical(printed(new_f, args, seed), printed(old_f, args, seed))
}
