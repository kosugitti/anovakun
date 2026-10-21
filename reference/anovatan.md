# Run anovakun separately for each level of a factor

Splits the data by the factor given in `tfact` and runs
[`anovakun`](https://kosugitti.github.io/anovakun/reference/anovakun.md)
for each level.

## Usage

``` r
anovatan(dataset, design, ..., tfact = NULL, long = FALSE, type2 = FALSE, nopost = FALSE, tech = FALSE, data.frame = FALSE, copy = FALSE, holm = FALSE, hc = FALSE, s2r = FALSE, s2d = FALSE, fs1 = FALSE, fs2r = FALSE, fs2d = FALSE, welch = FALSE, criteria = FALSE, lb = FALSE, gg = FALSE, hf = FALSE, cm = FALSE, auto = FALSE, mau = FALSE, har = FALSE, iga = FALSE, ciga = FALSE, eta = FALSE, peta = FALSE, geta = NA, eps = FALSE, peps = FALSE, geps = NA, omega = FALSE, omegana = FALSE, pomega = FALSE, gomega = NA, gomegana = NA, prep = FALSE, nesci = FALSE, besci = FALSE, cilmd = FALSE, cilm = FALSE, cind = FALSE, cin = FALSE, ciml = FALSE, cipaird = FALSE, cipair = FALSE, bgraph = c(NA, NA))
```

## Arguments

- dataset:

  A data frame. Between-subjects factors are arranged in columns at the
  left (one label column per factor) and within-subjects levels across
  columns (wide format), unless `long = TRUE`.

- design:

  A character string giving the design, e.g. `"As"`, `"sA"`, `"AsB"`.
  Letters before `s` are between-subjects factors and letters after it
  are within-subjects factors.

- ...:

  The numbers of levels of each factor, given in order (e.g. `2, 3`).

- tfact:

  The label of the factor by which the data are split; `anovakun` is run
  for each level of this factor.

- long:

  If `TRUE`, read data in long format.

- type2:

  If `TRUE`, use Type II sums of squares (default is Type III).

- nopost:

  If `TRUE`, do not run post hoc analyses.

- tech:

  If `TRUE`, return the results as a list of data frames (technical
  output).

- data.frame:

  If `TRUE`, also return the data frame used in the computation.

- copy:

  If `TRUE`, also copy the output to the clipboard.

- holm:

  If `TRUE`, use Holm's method for multiple comparisons. With
  `hc = TRUE`, the Holm-Sidak method is used.

- hc:

  If `TRUE`, use the Holland-Copenhaver method for multiple comparisons.

- s2r:

  If `TRUE`, Shaffer's method counts hypotheses from the actual
  rejection pattern (Rasmussen's algorithm).

- s2d:

  If `TRUE`, Shaffer's method counts hypotheses from the actual
  rejection pattern (Donoghue's algorithm).

- fs1:

  If `TRUE`, use the F-Shaffer1 variant (the step-1 criterion is
  replaced by the step-2 criterion).

- fs2r:

  If `TRUE`, combine Shaffer2 and F-Shaffer1 (Rasmussen's algorithm).

- fs2d:

  If `TRUE`, combine Shaffer2 and F-Shaffer1 (Donoghue's algorithm).

- welch:

  If `TRUE`, use the Keselman-Keselman-Shaffer statistic with
  Welch-Satterthwaite degrees of freedom in multiple comparisons.

- criteria:

  If `TRUE`, show adjusted significance levels instead of adjusted p
  values in multiple comparisons.

- lb:

  If `TRUE`, adjust degrees of freedom of all within-subjects effects by
  the lower bound of epsilon.

- gg:

  If `TRUE`, adjust degrees of freedom of all within-subjects effects by
  the Greenhouse-Geisser epsilon.

- hf:

  If `TRUE`, adjust degrees of freedom of all within-subjects effects by
  the Huynh-Feldt epsilon.

- cm:

  If `TRUE`, adjust degrees of freedom of all within-subjects effects by
  the Chi-Muller epsilon.

- auto:

  If `TRUE`, apply the Greenhouse-Geisser adjustment only to effects
  whose sphericity test is significant.

- mau:

  If `TRUE`, use Mauchly's test of sphericity.

- har:

  If `TRUE`, use Harris's multisample sphericity test.

- iga:

  If `TRUE`, use the improved general approximation test.

- ciga:

  If `TRUE`, use the corrected improved general approximation test.

- eta:

  If `TRUE`, add eta squared to the ANOVA table.

- peta:

  If `TRUE`, add partial eta squared to the ANOVA table.

- geta:

  If `TRUE`, add generalized eta squared. A character string of factor
  labels marks those factors as measured factors.

- eps:

  If `TRUE`, add epsilon squared to the ANOVA table.

- peps:

  If `TRUE`, add partial epsilon squared to the ANOVA table.

- geps:

  If `TRUE`, add generalized epsilon squared. A character string of
  factor labels marks those factors as measured factors.

- omega:

  If `TRUE`, add omega squared (additive model).

- omegana:

  If `TRUE`, add omega squared (nonadditive model).

- pomega:

  If `TRUE`, add partial omega squared.

- gomega:

  If `TRUE`, add generalized omega squared (additive model). A character
  string of factor labels marks measured factors.

- gomegana:

  If `TRUE`, add generalized omega squared (nonadditive model). A
  character string of factor labels marks measured factors.

- prep:

  If `TRUE`, add p_rep to the ANOVA table.

- nesci:

  If `TRUE`, compute confidence intervals of the requested effect sizes
  based on the noncentral F distribution.

- besci:

  If `TRUE`, compute bootstrap confidence intervals of the requested
  effect sizes.

- cilmd:

  If `TRUE`, add difference-adjusted Loftus-Masson confidence intervals
  to the descriptive table.

- cilm:

  If `TRUE`, add Loftus-Masson confidence intervals to the descriptive
  table.

- cind:

  If `TRUE`, add difference-adjusted normalized confidence intervals to
  the descriptive table.

- cin:

  If `TRUE`, add normalized confidence intervals to the descriptive
  table.

- ciml:

  If `TRUE`, add confidence intervals based on a multilevel model
  (requires the lmerTest package).

- cipaird:

  If `TRUE`, output difference-adjusted pairwise confidence intervals.

- cipair:

  If `TRUE`, output pairwise confidence intervals.

- bgraph:

  Names of confidence-interval options (inner and outer, up to two) for
  drawing a bar graph with confidence intervals.

## Value

Results of `anovakun` for each level.

## Author

Ryuta Iseki (author); packaged by Koji Kosugi.

## References

ANOVA-kun: <https://riseki.cloudfree.jp/?ANOVA%E5%90%9B>
