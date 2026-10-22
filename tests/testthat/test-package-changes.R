# Behaviour added or changed by the packaging (not present in the original).

test_that("ci.bars draws on the current device and restores par()", {
  d <- designs$AsB
  grDevices::pdf(NULL)
  on.exit(grDevices::dev.off(), add = TRUE)
  before <- graphics::par(no.readonly = TRUE)
  out <- utils::capture.output(
    anovakun(make_wide(d$design, d$levels, d$n), d$design, 2, 3, bgraph = c("cind", "cin")))
  expect_identical(graphics::par(no.readonly = TRUE), before)
  expect_true(any(grepl("Cousineau-Morey", out)))
})

test_that("options(contrasts) are restored even when the analysis stops", {
  d <- designs$AsB
  old <- options("contrasts")
  on.exit(options(old), add = TRUE)
  expect_error(utils::capture.output(anovakun(make_wide(d$design, d$levels, d$n), "AsB", 2, 2)))
  expect_identical(options("contrasts"), old)
})

test_that("the output header names the bundled ANOVA-kun version", {
  d <- designs$As
  r <- utils::capture.output(anovakun(make_wide(d$design, d$levels, d$n), "As", 3, tech = TRUE))
  expect_true(any(grepl("anovakun 4.8.9 under", r, fixed = TRUE)))
})

test_that("anovakun returns an object and prints only when shown", {
  d <- designs$AsB
  w <- make_wide(d$design, d$levels, d$n)
  expect_identical(utils::capture.output(x <- anovakun(w, "AsB", 2, 3)), character(0))
  expect_s3_class(x, "anovakun")
  expect_named(x, c("INFORMATION", "DESCRIPTIVE STATISTICS", "SPHERICITY INDICES",
                    "ANOVA TABLE", "POST ANALYSES"))
  out <- utils::capture.output(y <- print(x))
  expect_identical(y, x)
  expect_true(any(grepl("<< ANOVA TABLE >>", out, fixed = TRUE)))
  expect_identical(utils::capture.output(x), out)
})

test_that("anovatan returns an object with one anovakun result per level", {
  d <- designs$AsBC
  w <- make_wide(d$design, d$levels, d$n)
  expect_identical(utils::capture.output(x <- anovatan(w, "AsBC", 2, 2, 3, tfact = "A")), character(0))
  expect_s3_class(x, "anovatan")
  expect_named(x$results, c("a1", "a2"))
  expect_true(all(vapply(x$results, inherits, logical(1), "anovakun")))
  out <- utils::capture.output(print(x))
  expect_identical(sum(grepl("[[ Simple Effects for", out, fixed = TRUE)), 2L)
  t <- anovatan(w, "AsBC", 2, 2, 3, tfact = "A", tech = TRUE)
  expect_identical(t[c(TRUE, FALSE)], list("[[ Simple Effects for a1 ]]", "[[ Simple Effects for a2 ]]"))
  expect_false(inherits(t, "anovatan"))
})

test_that("bootstrap progress goes to messages, not to the output", {
  skip_on_cran()
  d <- designs$As
  w <- make_wide(d$design, d$levels, d$n)
  expect_message(out <- utils::capture.output(x <- anovakun(w, "As", 3, peta = TRUE, besci = TRUE)),
                 "Bootstrapping")
  expect_identical(out, character(0))
})
