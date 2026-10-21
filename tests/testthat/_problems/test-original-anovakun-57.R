# Extracted from test-original-anovakun.R:57

# prequel ----------------------------------------------------------------------
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

# test -------------------------------------------------------------------------
for (d in designs[c("AsB", "sAB", "AsBC", "ABsC")]) {
    expect_same_as_original("anovakun", c(list(make_long(d$design, d$levels, d$n), d$design),
                                          as.list(d$levels), list(long = TRUE, holm = TRUE)))
  }
