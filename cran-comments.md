## Test environments

* local macOS (aarch64-apple-darwin), R 4.6.x (--as-cran, 2026-11-02):
  0 errors, 0 warnings, 0 notes
* win-builder R-devel (2026-11-01 r90825 ucrt): 1 NOTE (New submission;
  the "possibly misspelled words" are proper names and statistical terms:
  Bonferroni, Holm, Iseki, Ryuta, sphericity), check time 109 s
* mac-builder R release: (fill in: sent 2026-11-02)
* GitHub Actions: macOS, Windows and Ubuntu on R release, Ubuntu on R-devel
  and R oldrel-1: (fill in: re-run for the submitted commit)

Version 1.0.0 (bundling 'ANOVA-kun' 4.8.9) passed the same checks on
2026-10-22/24 (win-builder: 1 NOTE "New submission"; mac-builder: OK;
Actions: all OK). Version 1.1.0 bundles 'ANOVA-kun' 4.9.0, released on
2026-11-02.

## R CMD check results

0 errors | 0 warnings | 0 notes (apart from "New submission")

## This is a new submission

This package distributes 'ANOVA-kun' by Ryuta Iseki, a widely used set of R
functions for factorial ANOVA in Japanese psychology, so that it can be
installed with install.packages(). The author is listed as the author and
copyright holder (MIT licence, with his permission); the maintainer only
packages the code. The computations are unchanged from the original source
(bundled in inst/original/), and the tests compare the package functions with
the original source across designs and options.

## Notes for the reviewer

* Methods and references: the package implements many procedures (modified
  Bonferroni multiple comparisons, multisample sphericity tests, epsilon
  corrections, generalized effect sizes, confidence intervals for
  within-subjects designs, ...). Their references are listed on the pages of
  the original 'ANOVA-kun' site, which is given in the Description field.
* Output: `anovakun()` and `anovatan()` return objects; the tables are written
  only by their `print()` methods. The progress of the bootstrap is reported
  with `message()`.

* `read.clip()` and the `copy = TRUE` option read from or write to the system
  clipboard. They do so only when the user asks for it; the examples that use
  the clipboard are wrapped in \dontrun{}.
* The suggested packages 'lmerTest', 'lme4' and 'pbkrtest' are needed only for
  the `ciml = TRUE` option and the corresponding test is skipped when they are
  not installed.
