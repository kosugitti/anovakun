\name{ci.bars}
\alias{ci.bars}
\title{Bar graph with confidence intervals}
\description{
Draws a bar graph of cell means with confidence intervals. Usually called through the \code{bgraph} option of \code{\link{anovakun}}.
}
\usage{
ci.bars(dat, design, factnames = NA, conf.level = 0.95, inn.tier = "cind", out.tier = NA, main = NULL, ylab = NULL, barmin = 0)
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
A bar graph is drawn as a side effect.
}
\author{Ryuta Iseki (author); packaged by Koji Kosugi.}
\references{
ANOVA-kun: \url{https://riseki.cloudfree.jp/?ANOVA\%E5\%90\%9B}
}
