\name{anovatan}
\alias{anovatan}
\alias{print.anovatan}
\title{Run anovakun separately for each level of a factor}
\description{
Splits the data by the factor given in \code{tfact} and runs \code{\link{anovakun}} for each level.
}
\usage{
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

\method{print}{anovatan}(x, ...)
}
\arguments{
  \item{x}{An object of class \code{"anovatan"}.}
  \item{dataset}{A data frame. Between-subjects factors are arranged in columns at the left (one label column per factor) and within-subjects levels across columns (wide format), unless \code{long = TRUE}.}
  \item{design}{A character string giving the design, e.g. \code{"As"}, \code{"sA"}, \code{"AsB"}. Letters before \code{s} are between-subjects factors and letters after it are within-subjects factors.}
  \item{\dots}{The numbers of levels of each factor, given in order (e.g. \code{2, 3}). Ignored by the \code{print} method.}
  \item{tfact}{The label of the factor by which the data are split; \code{anovakun} is run for each level of this factor.}
  \item{long}{If \code{TRUE}, read data in long format.}
  \item{type2}{If \code{TRUE}, use Type II sums of squares (default is Type III).}
  \item{nopost}{If \code{TRUE}, do not run post hoc analyses.}
  \item{tech}{If \code{TRUE}, return the results as a list of data frames (technical output).}
  \item{data.frame}{If \code{TRUE}, also return the data frame used in the computation.}
  \item{copy}{If \code{TRUE}, also copy the output to the clipboard.}
  \item{holm}{If \code{TRUE}, use Holm's method for multiple comparisons. With \code{hc = TRUE}, the Holm-Sidak method is used.}
  \item{hc}{If \code{TRUE}, use the Holland-Copenhaver method for multiple comparisons.}
  \item{s2r}{If \code{TRUE}, Shaffer's method counts hypotheses from the actual rejection pattern (Rasmussen's algorithm).}
  \item{s2d}{If \code{TRUE}, Shaffer's method counts hypotheses from the actual rejection pattern (Donoghue's algorithm).}
  \item{fs1}{If \code{TRUE}, use the F-Shaffer1 variant (the step-1 criterion is replaced by the step-2 criterion).}
  \item{fs2r}{If \code{TRUE}, combine Shaffer2 and F-Shaffer1 (Rasmussen's algorithm).}
  \item{fs2d}{If \code{TRUE}, combine Shaffer2 and F-Shaffer1 (Donoghue's algorithm).}
  \item{welch}{If \code{TRUE}, use the Keselman-Keselman-Shaffer statistic with Welch-Satterthwaite degrees of freedom in multiple comparisons.}
  \item{criteria}{If \code{TRUE}, show adjusted significance levels instead of adjusted p values in multiple comparisons.}
  \item{lb}{If \code{TRUE}, adjust degrees of freedom of all within-subjects effects by the lower bound of epsilon.}
  \item{gg}{If \code{TRUE}, adjust degrees of freedom of all within-subjects effects by the Greenhouse-Geisser epsilon.}
  \item{hf}{If \code{TRUE}, adjust degrees of freedom of all within-subjects effects by the Huynh-Feldt epsilon.}
  \item{cm}{If \code{TRUE}, adjust degrees of freedom of all within-subjects effects by the Chi-Muller epsilon.}
  \item{auto}{If \code{TRUE}, apply the Greenhouse-Geisser adjustment only to effects whose sphericity test is significant.}
  \item{mau}{If \code{TRUE}, use Mauchly's test of sphericity.}
  \item{har}{If \code{TRUE}, use Harris's multisample sphericity test.}
  \item{iga}{If \code{TRUE}, use the improved general approximation test.}
  \item{ciga}{If \code{TRUE}, use the corrected improved general approximation test.}
  \item{eta}{If \code{TRUE}, add eta squared to the ANOVA table.}
  \item{peta}{If \code{TRUE}, add partial eta squared to the ANOVA table.}
  \item{geta}{If \code{TRUE}, add generalized eta squared. A character string of factor labels marks those factors as measured factors.}
  \item{eps}{If \code{TRUE}, add epsilon squared to the ANOVA table.}
  \item{peps}{If \code{TRUE}, add partial epsilon squared to the ANOVA table.}
  \item{geps}{If \code{TRUE}, add generalized epsilon squared. A character string of factor labels marks those factors as measured factors.}
  \item{omega}{If \code{TRUE}, add omega squared (additive model).}
  \item{omegana}{If \code{TRUE}, add omega squared (nonadditive model).}
  \item{pomega}{If \code{TRUE}, add partial omega squared.}
  \item{gomega}{If \code{TRUE}, add generalized omega squared (additive model). A character string of factor labels marks measured factors.}
  \item{gomegana}{If \code{TRUE}, add generalized omega squared (nonadditive model). A character string of factor labels marks measured factors.}
  \item{prep}{If \code{TRUE}, add p_rep to the ANOVA table.}
  \item{nesci}{If \code{TRUE}, compute confidence intervals of the requested effect sizes based on the noncentral F distribution.}
  \item{besci}{If \code{TRUE}, compute bootstrap confidence intervals of the requested effect sizes.}
  \item{cilmd}{If \code{TRUE}, add difference-adjusted Loftus-Masson confidence intervals to the descriptive table.}
  \item{cilm}{If \code{TRUE}, add Loftus-Masson confidence intervals to the descriptive table.}
  \item{cind}{If \code{TRUE}, add difference-adjusted normalized confidence intervals to the descriptive table.}
  \item{cin}{If \code{TRUE}, add normalized confidence intervals to the descriptive table.}
  \item{ciml}{If \code{TRUE}, add confidence intervals based on a multilevel model (requires the \pkg{lmerTest} and \pkg{pbkrtest} packages).}
  \item{cipaird}{If \code{TRUE}, output difference-adjusted pairwise confidence intervals.}
  \item{cipair}{If \code{TRUE}, output pairwise confidence intervals.}
  \item{bgraph}{Names of confidence-interval options (inner and outer, up to two) for drawing a bar graph with confidence intervals.}
}
\value{
An object of class \code{"anovatan"}: a list with \code{results}, the
\code{"anovakun"} objects for each level of the split factor(s),
\code{removed}, the number of cases removed because of missing values, and,
if \code{data.frame = TRUE}, \code{DATA.FRAME}, the split data frames.
Printing it shows the tables of each level in the same layout as the
original ANOVA-kun. With \code{tech = TRUE}, a plain list is returned
instead, holding in turn the heading of each level
(\code{"[[ Simple Effects for ... ]]"}) and its technical output (see
\code{\link{anovakun}}); \code{data.frame} is ignored in this case.
}
\author{Ryuta Iseki (author); packaged by Koji Kosugi.}
\references{
ANOVA-kun: \url{https://riseki.cloudfree.jp/?ANOVA\%E5\%90\%9B}
}
\seealso{\code{\link{anovakun}}}
\examples{
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
}
