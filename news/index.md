# Changelog

## anovakun 1.0.0

- First release as an R package. It contains ‘ANOVA-kun’ 4.8.9 by Ryuta
  Iseki (<https://riseki.cloudfree.jp/?ANOVA%E5%90%9B>) without changes
  to its computations.
- Tests compare
  [`anovakun()`](https://kosugitti.github.io/anovakun/reference/anovakun.md)
  and
  [`anovatan()`](https://kosugitti.github.io/anovakun/reference/anovatan.md)
  with the original source (`inst/original/`) across designs and
  options.

### Results as objects

- [`anovakun()`](https://kosugitti.github.io/anovakun/reference/anovakun.md)
  returns an object of class `"anovakun"` instead of writing the tables
  to the console. The tables are written by its
  [`print()`](https://rdrr.io/r/base/print.html) method in the same
  layout as the original, so calling
  [`anovakun()`](https://kosugitti.github.io/anovakun/reference/anovakun.md)
  at the top level shows the same output as before, while
  `res <- anovakun(...)` shows nothing and keeps the results. The object
  holds the same list as `tech = TRUE`. `tech = TRUE` still returns the
  plain list.
- [`anovatan()`](https://kosugitti.github.io/anovakun/reference/anovatan.md)
  returns an object of class `"anovatan"` holding the `"anovakun"`
  results for each level (and the split data with `data.frame = TRUE`).
  With `tech = TRUE` it returns a list of the heading and the plain list
  of each level in turn, as the original does from 4.9.0 (up to 4.8.9
  the original printed only the headings and returned `NULL`).
- With `data.frame = TRUE`, the data frame is an element (`DATA.FRAME`)
  of the returned object; the original returned it alone.
- With `bgraph`, the bar graph is drawn when
  [`anovakun()`](https://kosugitti.github.io/anovakun/reference/anovakun.md)
  is called, i.e. before the tables are printed.
- `copy = TRUE` writes the printed tables to the clipboard instead of
  redirecting the console with
  [`sink()`](https://rdrr.io/r/base/sink.html).
- The progress of the bootstrap (`besci = TRUE`) is reported with
  [`message()`](https://rdrr.io/r/base/message.html); the progress bar
  is shown only in interactive sessions.

### Changes from the original source (no effect on the results)

- `ciml = TRUE` calls ‘lmerTest’ through its namespace instead of
  [`library(lmerTest)`](https://github.com/runehaubo/lmerTestR);
  ‘lmerTest’ is a suggested package.
- [`ci.bars()`](https://kosugitti.github.io/anovakun/reference/ci.bars.md)
  draws on the current graphics device instead of opening a new
  [`quartz()`](https://rdrr.io/r/grDevices/quartz.html) or
  [`x11()`](https://rdrr.io/r/grDevices/x11.html) window.
- [`options()`](https://rdrr.io/r/base/options.html) and
  [`par()`](https://rdrr.io/r/graphics/par.html) are restored with
  [`on.exit()`](https://rdrr.io/r/base/on.exit.html), so they are
  restored even if the analysis stops with an error.
- The operating system (for `copy = TRUE`,
  [`read.clip()`](https://kosugitti.github.io/anovakun/reference/read.clip.md))
  is detected with [`Sys.info()`](https://rdrr.io/r/base/Sys.info.html);
  the original test on `.Platform` did not recognise macOS when R was
  built from source.
- Internal functions `anova.modeler()` and `anova.output()` were renamed
  to `anova_modeler()` and `anova_output()` so that they are not
  mistaken for S3 methods of
  [`anova()`](https://rdrr.io/r/stats/anova.html). The unused internal
  function `hmean()` was removed.
