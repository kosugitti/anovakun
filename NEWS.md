# anovakun 1.0.0

* First release as an R package. It contains 'ANOVA-kun' 4.8.9 by Ryuta Iseki
  (<https://riseki.cloudfree.jp/?ANOVA%E5%90%9B>) without changes to its
  computations.
* Tests compare `anovakun()` and `anovatan()` with the original source
  (`inst/original/`) across designs and options.

## Changes from the original source (no effect on the results)

* `ciml = TRUE` calls 'lmerTest' through its namespace instead of
  `library(lmerTest)`; 'lmerTest' is a suggested package.
* `ci.bars()` draws on the current graphics device instead of opening a new
  `quartz()` or `x11()` window.
* `options()`, `par()` and `sink()` (for `copy = TRUE`) are restored with
  `on.exit()`, so they are restored even if the analysis stops with an error or
  returns early (e.g. `copy = TRUE` with `tech = TRUE`).
* The operating system (for `copy = TRUE`, `read.clip()`) is detected with
  `Sys.info()`; the original test on `.Platform` did not recognise macOS when R
  was built from source.
* Internal functions `anova.modeler()` and `anova.output()` were renamed to
  `anova_modeler()` and `anova_output()` so that they are not mistaken for S3
  methods of `anova()`. The unused internal function `hmean()` was removed.
