# The packaged anovatan() must reproduce the original ANOVA-kun exactly.

test_that("anovatan: split by a between-subjects factor", {
  d <- designs$AsBC
  expect_same_as_original("anovatan", design_args(d, tfact = "A"), tech = FALSE)
  expect_same_as_original("anovatan", design_args(d, tfact = "A", holm = TRUE, peta = TRUE), tech = FALSE)
})

test_that("anovatan: split by a within-subjects factor", {
  d <- designs$ABsC
  expect_same_as_original("anovatan", design_args(d, tfact = "C"), tech = FALSE)
  expect_same_as_original("anovatan", design_args(d, tfact = "C", gg = TRUE, geta = TRUE), tech = FALSE)
})

test_that("anovatan: split by two factors", {
  d <- designs$AsBC
  expect_same_as_original("anovatan", design_args(d, tfact = c("A", "B")), tech = FALSE)
})

test_that("anovatan: data.frame = TRUE returns the split data", {
  d <- designs$AsBC
  expect_same_as_original("anovatan", design_args(d, tfact = "A", data.frame = TRUE), tech = FALSE)
})

test_that("anovatan: no factor to split", {
  d <- designs$AsB
  expect_same_as_original("anovatan", design_args(d), tech = FALSE, error = TRUE)
})
