# Analysis of variance for factorial designs (ANOVA-kun)

Performs analysis of variance for between-subjects, within-subjects, and
mixed designs, given the design type and the number of levels of each
factor. Post hoc analyses (multiple comparisons and simple effects),
sphericity tests and corrections, effect sizes and confidence intervals
are included. This is the ANOVA-kun function written by Ryuta Iseki,
packaged without changing its computations.

## Usage

``` r
anovakun(dataset, design, ..., long = FALSE, type2 = FALSE, nopost = FALSE,
  tech = FALSE, data.frame = FALSE, copy = FALSE, holm = FALSE, hc = FALSE,
  s2r = FALSE, s2d = FALSE, fs1 = FALSE, fs2r = FALSE, fs2d = FALSE,
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

Results are printed as tables. With `tech = TRUE`, a list of data frames
is returned.

## Author

Ryuta Iseki (author); packaged by Koji Kosugi.

## References

ANOVA-kun: <https://riseki.cloudfree.jp/?ANOVA%E5%90%9B>

## Examples

``` r
# AsBC design (example from the original ANOVA-kun documentation):
# factor A (2 levels, between) x B (2 levels, within) x C (2 levels, within)
dat <- data.frame(
  A    = c("a1", "a1", "a1", "a2", "a2", "a2"),
  b1c1 = c(12, 13, 11, 18, 17, 15),
  b1c2 = c( 9, 10, 10, 12, 14, 13),
  b2c1 = c(14, 14, 13, 16, 15, 18),
  b2c2 = c(13, 12, 15, 15, 14, 15)
)
anovakun(dat, "AsBC", 2, 2, 2)
#> 
#> [ AsBC-Type Design ]
#> 
#> This output was generated by anovakun 4.8.9 under R version 4.6.1.
#> It was executed on Wed Oct 21 22:16:20 2026.
#> 
#>  
#> << DESCRIPTIVE STATISTICS >>
#> 
#> -----------------------------------
#>   A   B   C   n     Mean    S.D. 
#> -----------------------------------
#>  a1  b1  c1   3  12.0000  1.0000 
#>  a1  b1  c2   3   9.6667  0.5774 
#>  a1  b2  c1   3  13.6667  0.5774 
#>  a1  b2  c2   3  13.3333  1.5275 
#> 
#>  a2  b1  c1   3  16.6667  1.5275 
#>  a2  b1  c2   3  13.0000  1.0000 
#>  a2  b2  c1   3  16.3333  1.5275 
#>  a2  b2  c2   3  14.6667  0.5774 
#> -----------------------------------
#> 
#> 
#> << SPHERICITY INDICES >>
#> 
#> == Mendoza's Multisample Sphericity Test and Epsilons ==
#> 
#> -------------------------------------------------------------------------
#>  Effect  Lambda  approx.Chi  df      p         LB     GG     HF     CM 
#> -------------------------------------------------------------------------
#>  Global  0.0000         Inf  11 0.0000 *** 0.3333 0.8563 2.5262 1.0916 
#>       B  0.7696      0.3928   1 0.5308 ns  1.0000 1.0000 1.0000 1.0000 
#>       C  0.6011      0.7635   1 0.3822 ns  1.0000 1.0000 1.0000 1.0000 
#>   B x C  0.3600      1.5325   1 0.2157 ns  1.0000 1.0000 1.0000 1.0000 
#> -------------------------------------------------------------------------
#>                               LB = lower.bound, GG = Greenhouse-Geisser
#>                              HF = Huynh-Feldt-Lecoutre, CM = Chi-Muller
#> 
#> 
#> << ANOVA TABLE >>
#> 
#> ----------------------------------------------------------------
#>         Source        SS  df       MS   F-ratio  p-value      
#> ----------------------------------------------------------------
#>              A   54.0000   1  54.0000  648.0000   0.0000 ***  
#>          s x A    0.3333   4   0.0833                         
#> ----------------------------------------------------------------
#>              B   16.6667   1  16.6667    8.0000   0.0474 *    
#>          A x B    6.0000   1   6.0000    2.8800   0.1649 ns   
#>      s x A x B    8.3333   4   2.0833                         
#> ----------------------------------------------------------------
#>              C   24.0000   1  24.0000   15.1579   0.0176 *    
#>          A x C    2.6667   1   2.6667    1.6842   0.2641 ns   
#>      s x A x C    6.3333   4   1.5833                         
#> ----------------------------------------------------------------
#>          B x C    6.0000   1   6.0000    4.8000   0.0936 +    
#>      A x B x C    0.0000   1   0.0000    0.0000   1.0000 ns   
#>  s x A x B x C    5.0000   4   1.2500                         
#> ----------------------------------------------------------------
#>          Total  129.3333  23   5.6232                         
#>                     +p < .10, *p < .05, **p < .01, ***p < .001
#> 
#> 
#> << POST ANALYSES >>
#> 
#> < SIMPLE EFFECTS for "B x C" INTERACTION >
#> 
#> -------------------------------
#>   B   C   n     Mean    S.D. 
#> -------------------------------
#>  b1  c1   6  14.3333  2.8048 
#>  b1  c2   6  11.3333  1.9664 
#>  b2  c1   6  15.0000  1.7889 
#>  b2  c2   6  14.0000  1.2649 
#> -------------------------------
#> 
#> --------------------------------------------------------------------------
#>   Effect  Lambda  approx.Chi  df      p         LB     GG     HF     CM 
#> --------------------------------------------------------------------------
#>  B at c1  0.1479      2.8665   1 0.0904 +   1.0000 1.0000 1.0000 1.0000 
#>  B at c2  1.0000     -0.0000   1 1.0000 ns  1.0000 1.0000 1.0000 1.0000 
#>  C at b1  0.7197      0.4933   1 0.4824 ns  1.0000 1.0000 1.0000 1.0000 
#>  C at b2  0.7197      0.4933   1 0.4824 ns  1.0000 1.0000 1.0000 1.0000 
#> --------------------------------------------------------------------------
#>                                LB = lower.bound, GG = Greenhouse-Geisser
#>                               HF = Huynh-Feldt-Lecoutre, CM = Chi-Muller
#> 
#> -----------------------------------------------------------
#>       Source       SS  df       MS  F-ratio  p-value     
#> -----------------------------------------------------------
#>      B at c1   1.3333   1   1.3333   0.6154   0.4766 ns  
#>  s x B at c1   8.6667   4   2.1667                       
#> -----------------------------------------------------------
#>      B at c2  21.3333   1  21.3333  18.2857   0.0129 *   
#>  s x B at c2   4.6667   4   1.1667                       
#> -----------------------------------------------------------
#>      C at b1  27.0000   1  27.0000  19.0588   0.0120 *   
#>  s x C at b1   5.6667   4   1.4167                       
#> -----------------------------------------------------------
#>      C at b2   3.0000   1   3.0000   2.1176   0.2193 ns  
#>  s x C at b2   5.6667   4   1.4167                       
#> -----------------------------------------------------------
#>                +p < .10, *p < .05, **p < .01, ***p < .001
#> 
#> output is over --------------------///
#> 
```
