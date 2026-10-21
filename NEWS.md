# anovakun 1.0.0

* First release as an R package. It contains 'ANOVA-kun' 4.8.9 by Ryuta Iseki
  (<https://riseki.cloudfree.jp/?ANOVA%E5%90%9B>) without changes to its
  computations.
* Tests compare `anovakun()` and `anovatan()` with the original source
  (`inst/original/`) across designs and options.

## Results as objects

* `anovakun()` returns an object of class `"anovakun"` instead of writing the
  tables to the console. The tables are written by its `print()` method in the
  same layout as the original, so calling `anovakun()` at the top level shows
  the same output as before, while `res <- anovakun(...)` shows nothing and
  keeps the results. The object holds the same list as `tech = TRUE`.
  `tech = TRUE` still returns the plain list.
* `anovatan()` returns an object of class `"anovatan"` holding the
  `"anovakun"` results for each level (and the split data with
  `data.frame = TRUE`). With `tech = TRUE` it returns the plain lists of each
  level; the original printed only the headings and returned `NULL`.
* With `data.frame = TRUE`, the data frame is an element (`DATA.FRAME`) of the
  returned object; the original returned it alone.
* With `bgraph`, the bar graph is drawn when `anovakun()` is called, i.e.
  before the tables are printed.
* `copy = TRUE` writes the printed tables to the clipboard instead of
  redirecting the console with `sink()`.
* The progress of the bootstrap (`besci = TRUE`) is reported with `message()`;
  the progress bar is shown only in interactive sessions.

## Changes from the original source (no effect on the results)

* `ciml = TRUE` calls 'lmerTest' through its namespace instead of
  `library(lmerTest)`; 'lmerTest' is a suggested package.
* `ci.bars()` draws on the current graphics device instead of opening a new
  `quartz()` or `x11()` window.
* `options()` and `par()` are restored with `on.exit()`, so they are restored
  even if the analysis stops with an error.
* The operating system (for `copy = TRUE`, `read.clip()`) is detected with
  `Sys.info()`; the original test on `.Platform` did not recognise macOS when R
  was built from source.
* Internal functions `anova.modeler()` and `anova.output()` were renamed to
  `anova_modeler()` and `anova_output()` so that they are not mistaken for S3
  methods of `anova()`. The unused internal function `hmean()` was removed.
