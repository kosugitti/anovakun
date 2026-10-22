# The packaged anovakun() must reproduce the original ANOVA-kun exactly.

option_sets <- list(
  default   = list(),
  type2     = list(type2 = TRUE),
  nopost    = list(nopost = TRUE),
  dataframe = list(data.frame = TRUE),
  # multiple comparisons
  holm      = list(holm = TRUE),
  hc        = list(hc = TRUE),
  s2r       = list(s2r = TRUE),
  s2d       = list(s2d = TRUE),
  fs1       = list(fs1 = TRUE),
  fs2r      = list(fs2r = TRUE),
  fs2d      = list(fs2d = TRUE),
  hc_s2r    = list(hc = TRUE, s2r = TRUE),
  holm_hc   = list(holm = TRUE, hc = TRUE),
  welch     = list(welch = TRUE),
  criteria  = list(criteria = TRUE),
  # sphericity
  lb        = list(lb = TRUE),
  gg        = list(gg = TRUE),
  hf        = list(hf = TRUE),
  cm        = list(cm = TRUE),
  auto      = list(auto = TRUE),
  mau       = list(mau = TRUE),
  har       = list(har = TRUE),
  iga       = list(iga = TRUE),
  ciga      = list(ciga = TRUE),
  # effect sizes
  eta       = list(eta = TRUE, peta = TRUE, geta = TRUE),
  geta_A    = list(geta = "A"),
  eps       = list(eps = TRUE, peps = TRUE, geps = TRUE),
  omega     = list(omega = TRUE, omegana = TRUE, pomega = TRUE, gomega = TRUE, gomegana = TRUE),
  prep      = list(prep = TRUE),
  nesci     = list(eta = TRUE, peta = TRUE, geta = TRUE, eps = TRUE, peps = TRUE, geps = TRUE,
                   omega = TRUE, pomega = TRUE, gomega = TRUE, nesci = TRUE),
  # confidence intervals of means
  ci        = list(cilmd = TRUE, cilm = TRUE, cind = TRUE, cin = TRUE),
  cipair    = list(cipaird = TRUE, cipair = TRUE),
  # combination
  mixed     = list(type2 = TRUE, holm = TRUE, welch = TRUE, auto = TRUE, mau = TRUE,
                   peta = TRUE, geta = TRUE, nesci = TRUE, cind = TRUE)
)

for (dn in names(designs)) {
  for (on in names(option_sets)) {
    test_that(paste("anovakun:", dn, "/", on), {
      expect_same_as_original("anovakun", do.call(design_args, c(list(designs[[dn]]), option_sets[[on]])))
    })
  }
}

test_that("anovakun: long format", {
  for (d in designs[c("AsB", "sAB", "AsBC", "ABsC")]) {
    expect_same_as_original("anovakun", c(list(make_long(d$design, d$levels, d$n), d$design),
                                          as.list(d$levels), list(long = TRUE, holm = TRUE)))
  }
})

test_that("anovakun: named factors and levels", {
  d <- designs$AsBC
  expect_same_as_original("anovakun", list(make_wide(d$design, d$levels, d$n), d$design,
                                           group = c("ctrl", "exp"), time = c("pre", "post"),
                                           task = c("x", "y", "z"), peta = TRUE))
})

test_that("anovakun: cases with missing values are removed", {
  d <- designs$AsBC
  expect_same_as_original("anovakun", list(make_wide(d$design, d$levels, d$n, missing = 2),
                                           d$design, 2, 2, 3))
})

test_that("anovakun: input errors", {
  d <- designs$AsB
  expect_same_as_original("anovakun", list(make_wide(d$design, d$levels, d$n), "AsB", 2, 2), error = TRUE)
  expect_same_as_original("anovakun", list(make_wide(d$design, d$levels, d$n), "AsB", 2, 3, holmm = TRUE), error = TRUE)
})

test_that("anovakun: simple effects of a between-subjects factor with iga/ciga", {
  for (opt in list(list(iga = TRUE), list(ciga = TRUE), list(iga = TRUE, eta = TRUE, nesci = TRUE))) {
    expect_same_as_original("anovakun", c(list(crossing_AsB, "AsB", 2, 3), opt))
  }
})

test_that("anovakun: multilevel confidence intervals (ciml)", {
  skip_if_not_installed("lmerTest")
  skip_if_not_installed("pbkrtest")  # Kenward-Roger degrees of freedom
  for (d in designs[c("sA", "AsB", "sAB")]) {
    expect_same_as_original("anovakun", design_args(d, ciml = TRUE))
  }
})

test_that("anovakun: bootstrap confidence intervals (besci)", {
  skip_on_cran()
  for (d in designs[c("As", "AsB")]) {
    expect_same_as_original("anovakun", design_args(d, peta = TRUE, geta = TRUE, besci = TRUE), seed = 42)
  }
})
