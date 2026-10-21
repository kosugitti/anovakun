\name{read.clip}
\alias{read.clip}
\title{Read a data table from the clipboard}
\description{
A wrapper of \code{\link[utils]{read.table}} that reads from the clipboard on Windows, macOS, and Linux (requires xclip on Linux).
}
\usage{
read.clip(...)
}
\arguments{
  \item{\dots}{Further arguments passed to \code{\link[utils]{read.table}}.}
}
\value{
A data frame.
}
\author{Ryuta Iseki (author); packaged by Koji Kosugi.}
\references{
ANOVA-kun: \url{https://riseki.cloudfree.jp/?ANOVA\%E5\%90\%9B}
}
\examples{
\dontrun{
# Copy a table (e.g. from a spreadsheet) to the clipboard, then:
dat <- read.clip(header = TRUE)
anovakun(dat, "AsB", 2, 3)
}
}
