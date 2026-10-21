## Test environments

* local macOS (aarch64-apple-darwin), R 4.6.x: 0 errors, 0 warnings,
  1 NOTE (HTML manual validation, an artifact of the local HTML Tidy version)
* win-builder R-devel: (fill in from the e-mail)
* mac-builder R release: (fill in from the e-mail)
* GitHub Actions: macOS, Windows and Ubuntu on R release, Ubuntu on R-devel
  and R oldrel-1: (fill in)

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

* `read.clip()` and the `copy = TRUE` option read from or write to the system
  clipboard. They do so only when the user asks for it; the examples that use
  the clipboard are wrapped in \dontrun{}.
* The suggested packages 'lmerTest', 'lme4' and 'pbkrtest' are needed only for
  the `ciml = TRUE` option and the corresponding test is skipped when they are
  not installed.
