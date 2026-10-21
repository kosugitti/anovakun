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
