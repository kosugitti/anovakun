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

### Changes from the original source (no effect on the results)

- `ciml = TRUE` calls ‘lmerTest’ through its namespace instead of
  [`library(lmerTest)`](https://github.com/runehaubo/lmerTestR);
  ‘lmerTest’ is a suggested package.
- [`ci.bars()`](https://kosugitti.github.io/anovakun/reference/ci.bars.md)
  draws on the current graphics device instead of opening a new
  [`quartz()`](https://rdrr.io/r/grDevices/quartz.html) or
  [`x11()`](https://rdrr.io/r/grDevices/x11.html) window.
- [`options()`](https://rdrr.io/r/base/options.html),
  [`par()`](https://rdrr.io/r/graphics/par.html) and
  [`sink()`](https://rdrr.io/r/base/sink.html) (for `copy = TRUE`) are
  restored with [`on.exit()`](https://rdrr.io/r/base/on.exit.html), so
  they are restored even if the analysis stops with an error or returns
  early (e.g. `copy = TRUE` with `tech = TRUE`).
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
