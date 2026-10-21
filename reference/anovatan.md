# Run anovakun separately for each level of a factor

Splits the data by the factor given in `tfact` and runs
[`anovakun`](https://kosugitti.github.io/anovakun/reference/anovakun.md)
for each level.

## Usage

``` r
anovatan(dataset, design, ..., tfact = NULL, long = FALSE, type2 = FALSE,
  nopost = FALSE, tech = FALSE, data.frame = FALSE, copy = FALSE, holm = FALSE,
  hc = FALSE, s2r = FALSE, s2d = FALSE, fs1 = FALSE, fs2r = FALSE, fs2d = FALSE,
  welch = FALSE, criteria = FALSE, lb = FALSE, gg = FALSE, hf = FALSE,
  cm = FALSE, auto = FALSE, mau = FALSE, har = FALSE, iga = FALSE, ciga = FALSE,
  eta = FALSE, peta = FALSE, geta = NA, eps = FALSE, peps = FALSE, geps = NA,
  omega = FALSE, omegana = FALSE, pomega = FALSE, gomega = NA, gomegana = NA,
  prep = FALSE, nesci = FALSE, besci = FALSE, cilmd = FALSE, cilm = FALSE,
  cind = FALSE, cin = FALSE, ciml = FALSE, cipaird = FALSE, cipair = FALSE,
  bgraph = c(NA, NA))
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
  (requires the lmerTest and pbkrtest packages).

- cipaird:

  If `TRUE`, output difference-adjusted pairwise confidence intervals.

- cipair:

  If `TRUE`, output pairwise confidence intervals.

- bgraph:

  Names of confidence-interval options (inner and outer, up to two) for
  drawing a bar graph with confidence intervals.

## Value

The results are printed. If `data.frame = TRUE`, the list of the split
data frames is returned.

## Author

Ryuta Iseki (author); packaged by Koji Kosugi.

## References

ANOVA-kun: <https://riseki.cloudfree.jp/?ANOVA%E5%90%9B>

## See also

[`anovakun`](https://kosugitti.github.io/anovakun/reference/anovakun.md)

## Examples

``` r
# AsBC design: A (2 levels, between) x B (2 levels, within) x C (2 levels, within)
dat <- data.frame(
  A    = c("a1", "a1", "a1", "a2", "a2", "a2"),
  b1c1 = c(12, 13, 11, 18, 17, 15),
  b1c2 = c( 9, 10, 10, 12, 14, 13),
  b2c1 = c(14, 14, 13, 16, 15, 18),
  b2c2 = c(13, 12, 15, 15, 14, 15)
)
# Simple effects of B and C at each level of A
anovatan(dat, "AsBC", 2, 2, 2, tfact = "A")
#> 
#> [[ Simple Effects for a1 ]]
#> 
#> [ sAB-Type Design ]
#> 
#> This output was generated by anovakun 4.8.9 under R version 4.6.1.
#> It was executed on Wed Oct 21 22:23:19 2026.
#> 
#>  
#> << DESCRIPTIVE STATISTICS >>
#> 
#> -------------------------------
#>   B   C   n     Mean    S.D. 
#> -------------------------------
#>  b1  c1   3  12.0000  1.0000 
#>  b1  c2   3   9.6667  0.5774 
#>  b2  c1   3  13.6667  0.5774 
#>  b2  c2   3  13.3333  1.5275 
#> -------------------------------
#> 
#> 
#> << SPHERICITY INDICES >>
#> 
#> == Mendoza's Multisample Sphericity Test and Epsilons ==
#> 
#> -------------------------------------------------------------------------
#>  Effect  Lambda  approx.Chi  df      p         LB     GG     HF     CM 
#> -------------------------------------------------------------------------
#>  Global  0.0000         Inf   5 0.0000 *** 0.3333 0.3906 0.6101 0.3333 
#>       B  1.0000     -0.0000   0            1.0000 1.0000 1.0000 1.0000 
#>       C  1.0000     -0.0000   0            1.0000 1.0000 1.0000 1.0000 
#>   B x C  1.0000     -0.0000   0            1.0000 1.0000 1.0000 1.0000 
#> -------------------------------------------------------------------------
#>                               LB = lower.bound, GG = Greenhouse-Geisser
#>                              HF = Huynh-Feldt-Lecoutre, CM = Chi-Muller
#> 
#> 
#> << ANOVA TABLE >>
#> 
#> ---------------------------------------------------------
#>     Source       SS  df       MS  F-ratio  p-value     
#> ---------------------------------------------------------
#>          s   0.1667   2   0.0833                       
#> ---------------------------------------------------------
#>          B  21.3333   1  21.3333  19.6923   0.0472 *   
#>      s x B   2.1667   2   1.0833                       
#> ---------------------------------------------------------
#>          C   5.3333   1   5.3333   2.0645   0.2873 ns  
#>      s x C   5.1667   2   2.5833                       
#> ---------------------------------------------------------
#>      B x C   3.0000   1   3.0000  12.0000   0.0742 +   
#>  s x B x C   0.5000   2   0.2500                       
#> ---------------------------------------------------------
#>      Total  37.6667  11   3.4242                       
#>              +p < .10, *p < .05, **p < .01, ***p < .001
#> 
#> 
#> << POST ANALYSES >>
#> 
#> < SIMPLE EFFECTS for "B x C" INTERACTION >
#> 
#> -----------------------------------------------------------------------
#>   Effect  Lambda  approx.Chi  df   p         LB     GG     HF     CM 
#> -----------------------------------------------------------------------
#>  B at c1  1.0000     -0.0000   0         1.0000 1.0000 1.0000 1.0000 
#>  B at c2  1.0000     -0.0000   0         1.0000 1.0000 1.0000 1.0000 
#>  C at b1  1.0000     -0.0000   0         1.0000 1.0000 1.0000 1.0000 
#>  C at b2  1.0000     -0.0000   0         1.0000 1.0000 1.0000 1.0000 
#> -----------------------------------------------------------------------
#>                             LB = lower.bound, GG = Greenhouse-Geisser
#>                            HF = Huynh-Feldt-Lecoutre, CM = Chi-Muller
#> 
#> -----------------------------------------------------------
#>       Source       SS  df       MS  F-ratio  p-value     
#> -----------------------------------------------------------
#>      B at c1   4.1667   1   4.1667  25.0000   0.0377 *   
#>  s x B at c1   0.3333   2   0.1667                       
#> -----------------------------------------------------------
#>      B at c2  20.1667   1  20.1667  17.2857   0.0533 +   
#>  s x B at c2   2.3333   2   1.1667                       
#> -----------------------------------------------------------
#>      C at b1   8.1667   1   8.1667  12.2500   0.0728 +   
#>  s x C at b1   1.3333   2   0.6667                       
#> -----------------------------------------------------------
#>      C at b2   0.1667   1   0.1667   0.0769   0.8075 ns  
#>  s x C at b2   4.3333   2   2.1667                       
#> -----------------------------------------------------------
#>                +p < .10, *p < .05, **p < .01, ***p < .001
#> 
#> output is over --------------------///
#> 
#> 
#> [[ Simple Effects for a2 ]]
#> 
#> [ sAB-Type Design ]
#> 
#> This output was generated by anovakun 4.8.9 under R version 4.6.1.
#> It was executed on Wed Oct 21 22:23:19 2026.
#> 
#>  
#> << DESCRIPTIVE STATISTICS >>
#> 
#> -------------------------------
#>   B   C   n     Mean    S.D. 
#> -------------------------------
#>  b1  c1   3  16.6667  1.5275 
#>  b1  c2   3  13.0000  1.0000 
#>  b2  c1   3  16.3333  1.5275 
#>  b2  c2   3  14.6667  0.5774 
#> -------------------------------
#> 
#> 
#> << SPHERICITY INDICES >>
#> 
#> == Mendoza's Multisample Sphericity Test and Epsilons ==
#> 
#> -------------------------------------------------------------------------
#>  Effect  Lambda  approx.Chi  df      p         LB     GG     HF     CM 
#> -------------------------------------------------------------------------
#>  Global  0.0000     27.0490   5 0.0012 **  0.3333 0.5622 3.2533 0.3333 
#>       B  1.0000     -0.0000   0            1.0000 1.0000 1.0000 1.0000 
#>       C  1.0000     -0.0000   0            1.0000 1.0000 1.0000 1.0000 
#>   B x C  1.0000     -0.0000   0            1.0000 1.0000 1.0000 1.0000 
#> -------------------------------------------------------------------------
#>                               LB = lower.bound, GG = Greenhouse-Geisser
#>                              HF = Huynh-Feldt-Lecoutre, CM = Chi-Muller
#> 
#> 
#> << ANOVA TABLE >>
#> 
#> ---------------------------------------------------------
#>     Source       SS  df       MS  F-ratio  p-value     
#> ---------------------------------------------------------
#>          s   0.1667   2   0.0833                       
#> ---------------------------------------------------------
#>          B   1.3333   1   1.3333   0.4324   0.5784 ns  
#>      s x B   6.1667   2   3.0833                       
#> ---------------------------------------------------------
#>          C  21.3333   1  21.3333  36.5714   0.0263 *   
#>      s x C   1.1667   2   0.5833                       
#> ---------------------------------------------------------
#>      B x C   3.0000   1   3.0000   1.3333   0.3675 ns  
#>  s x B x C   4.5000   2   2.2500                       
#> ---------------------------------------------------------
#>      Total  37.6667  11   3.4242                       
#>              +p < .10, *p < .05, **p < .01, ***p < .001
#> 
#> 
#> output is over --------------------///
#> 
```
