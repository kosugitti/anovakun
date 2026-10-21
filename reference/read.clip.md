# Read a data table from the clipboard

A wrapper of [`read.table`](https://rdrr.io/r/utils/read.table.html)
that reads from the clipboard on Windows, macOS, and Linux (requires
xclip on Linux).

## Usage

``` r
read.clip(...)
```

## Arguments

- ...:

  Further arguments passed to
  [`read.table`](https://rdrr.io/r/utils/read.table.html).

## Value

A data frame.

## Author

Ryuta Iseki (author); packaged by Koji Kosugi.

## References

ANOVA-kun: <https://riseki.cloudfree.jp/?ANOVA%E5%90%9B>

## Examples

``` r
if (FALSE) { # \dontrun{
# Copy a table (e.g. from a spreadsheet) to the clipboard, then:
dat <- read.clip(header = TRUE)
anovakun(dat, "AsB", 2, 3)
} # }
```
