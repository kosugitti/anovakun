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

# Run a function. Returns its value (or the error message) and what it wrote
# to standard output during the call. Messages (progress of the bootstrap)
# are not part of the comparison.
run <- function(f, args, seed) {
  set.seed(seed)
  out <- utils::capture.output(
    value <- tryCatch(suppressMessages(do.call(f, args)),
                      error = function(e) structure(conditionMessage(e), class = "run_error")))
  list(value = value, out = out)
}

# Drop the lines that differ from run to run (execution date, time spent and
# the progress of the bootstrap, which the original writes to the console).
stable_lines <- function(out) {
  out[!grepl("It was executed on|secs elapsed|Now Bootstrapping|\r", out)]
}

# What the user sees: for the package, the output during the call plus the
# printed result object; for the original, the output during the call.
shown <- function(r) {
  if (inherits(r$value, "run_error")) return(r$value)
  out <- r$out
  if (inherits(r$value, c("anovakun", "anovatan"))) {
    out <- c(out, utils::capture.output(print(r$value)))
  }
  stable_lines(out)
}

# The result object without its class, print information and execution date,
# i.e. the list that tech = TRUE returns.
as_tech <- function(x) {
  x <- unclass(x)
  attr(x, "printinfo") <- NULL
  x$INFORMATION <- NULL
  x
}

# The packaged function and the original must give identical results.
# * The tables shown to the user are identical.
# * anovakun(): tech = TRUE returns the identical list, and the result object
#   holds the same list; data.frame = TRUE returns the same data frame.
# * anovatan(): the split data frames are identical, and tech = TRUE returns
#   the same lists as the result object holds for each level.
# * The package writes nothing to the console during the call.
# `error = TRUE` says that the call is expected to stop; otherwise a call
# that stops is a failure, so that a broken test input cannot pass by
# producing the same error from both versions.
expect_same_as_original <- function(fun, args, seed = 1, error = FALSE) {
  # Build the test data now: making it uses the random number generator, which
  # would otherwise shift the bootstrap of the first call after set.seed().
  force(args)
  new_f <- getExportedValue("anovakun", fun)
  old_f <- get(fun, envir = orig)

  old <- run(old_f, args, seed)
  new <- run(new_f, args, seed)
  if (inherits(old$value, "run_error") && !error) {
    fail(paste("The original stopped unexpectedly:", old$value))
  }
  expect_identical(inherits(old$value, "run_error"), error)
  expect_identical(shown(new), shown(old))
  if (error) return(invisible())
  expect_identical(new$out, character(0))

  targs <- c(args, list(tech = TRUE))
  new_t <- run(new_f, targs, seed)$value
  if (fun == "anovakun") {
    old_t <- run(old_f, targs, seed)$value
    old_t$INFORMATION <- NULL
    new_t$INFORMATION <- NULL
    expect_identical(new_t, old_t)
    expect_identical(as_tech(new$value), new_t)
    expect_identical(new$value$DATA.FRAME, old$value$DATA.FRAME)
  } else {
    expect_identical(new$value$DATA.FRAME, old$value)
    new_t$DATA.FRAME <- NULL
    expect_identical(lapply(new_t, function(x) { x$INFORMATION <- NULL; x }),
                     lapply(new$value$results, as_tech))
  }
}
