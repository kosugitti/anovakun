# Bar graph with confidence intervals

Draws a bar graph of cell means with confidence intervals. Usually
called through the `bgraph` option of
[`anovakun`](https://kosugitti.github.io/anovakun/reference/anovakun.md).

## Usage

``` r
ci.bars(dat, design, factnames = NA, conf.level = 0.95, inn.tier = "cind", out.tier = NA, main = NULL, ylab = NULL, barmin = 0)
```

## Arguments

- dat:

  A data frame as used inside `anovakun` (subject column, factor
  columns, and the dependent variable in long format).

- design:

  A character string giving the design, e.g. `"As"`, `"sA"`, `"AsB"`.
  Letters before `s` are between-subjects factors and letters after it
  are within-subjects factors.

- factnames:

  Names of the factors. If `NA`, letters are used.

- conf.level:

  Confidence level.

- inn.tier:

  Type of the inner confidence interval (e.g. `"cind"`).

- out.tier:

  Type of the outer confidence interval, or `NA`.

- main:

  Main title of the plot.

- ylab:

  Label of the y axis.

- barmin:

  Lower end of the bars.

## Value

A bar graph is drawn as a side effect.

## Author

Ryuta Iseki (author); packaged by Koji Kosugi.

## References

ANOVA-kun: <https://riseki.cloudfree.jp/?ANOVA%E5%90%9B>
