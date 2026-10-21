# The packaged anovatan() must reproduce the original ANOVA-kun exactly.

test_that("anovatan: split by a between-subjects factor", {
  d <- designs$AsBC
  expect_same_as_original("anovatan", design_args(d, tfact = "A"))
  expect_same_as_original("anovatan", design_args(d, tfact = "A", holm = TRUE, peta = TRUE))
})

test_that("anovatan: split by a within-subjects factor", {
  d <- designs$ABsC
  expect_same_as_original("anovatan", design_args(d, tfact = "C"))
  expect_same_as_original("anovatan", design_args(d, tfact = "C", gg = TRUE, geta = TRUE))
})

test_that("anovatan: split by two factors", {
  d <- designs$AsBC
  expect_same_as_original("anovatan", design_args(d, tfact = c("A", "B")))
})

test_that("anovatan: data.frame = TRUE returns the split data", {
  d <- designs$AsBC
  expect_same_as_original("anovatan", design_args(d, tfact = "A", data.frame = TRUE))
})

test_that("anovatan: no factor to split", {
  d <- designs$AsB
  expect_same_as_original("anovatan", design_args(d), error = TRUE)
})
