\name{ci.bars}
\alias{ci.bars}
\title{Bar graph with confidence intervals}
\description{
Draws a bar graph of cell means with confidence intervals. Usually called through the \code{bgraph} option of \code{\link{anovakun}}.
}
\usage{
ci.bars(dat, design, factnames = NA, conf.level = 0.95, inn.tier = "cind",
  out.tier = NA, main = NULL, ylab = NULL, barmin = 0)
}
\arguments{
  \item{dat}{A data frame as used inside \code{anovakun} (subject column, factor columns, and the dependent variable in long format).}
  \item{design}{A character string giving the design, e.g. \code{"As"}, \code{"sA"}, \code{"AsB"}. Letters before \code{s} are between-subjects factors and letters after it are within-subjects factors.}
  \item{factnames}{Names of the factors. If \code{NA}, letters are used.}
  \item{conf.level}{Confidence level.}
  \item{inn.tier}{Type of the inner confidence interval (e.g. \code{"cind"}).}
  \item{out.tier}{Type of the outer confidence interval, or \code{NA}.}
  \item{main}{Main title of the plot.}
  \item{ylab}{Label of the y axis.}
  \item{barmin}{Lower end of the bars.}
}
\value{
A bar graph is drawn on the current graphics device as a side effect.
}
\author{Ryuta Iseki (author); packaged by Koji Kosugi.}
\references{
ANOVA-kun: \url{https://riseki.cloudfree.jp/?ANOVA\%E5\%90\%9B}
}
\seealso{\code{\link{anovakun}}}
\examples{
dat <- data.frame(
  A    = c("a1", "a1", "a1", "a2", "a2", "a2"),
  b1c1 = c(12, 13, 11, 18, 17, 15),
  b1c2 = c( 9, 10, 10, 12, 14, 13),
  b2c1 = c(14, 14, 13, 16, 15, 18),
  b2c2 = c(13, 12, 15, 15, 14, 15)
)
# Usually drawn through the bgraph option of anovakun()
anovakun(dat, "AsBC", 2, 2, 2, bgraph = c("cind", "cin"))

# Direct use on the long-format data that anovakun() builds internally
long <- anovakun(dat, "AsBC", 2, 2, 2, tech = TRUE, data.frame = TRUE)$DATA.FRAME
ci.bars(long, "AsBC", inn.tier = "cind", out.tier = "cin", main = "AsBC design")
}
