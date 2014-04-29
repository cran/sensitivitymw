\name{mscorev}
\alias{mscorev}

\title{
Computes the M-scores used by senmw.
}
\description{
Of limited interest to most users, mscorev computes the M-scores used by senmw for sensitivity analysis in observational studies using Huber-Maritz M-tests.  As discussed in Rosenbaum (2014, section 4.1), the ranges of these M-scores within matched sets are ranked.
}
\usage{
mscorev(ymat, inner = 0, trim = 2.5, qu = 0.5, TonT = FALSE)
}

\arguments{
  \item{ymat}{
ymat is a matrix as described in the documentation for senmw or senmv.
}
  \item{inner}{
inner is the parameter described in the documentation for senmw or senmv.
}
  \item{trim}{
trim is the parameter described in the documentation for senmw or senmv.
}
  \item{qu}{
qu is the lambda parameter described in the documentation for senmw or senmv.
}
  \item{TonT}{The TonT parameter is not used in the sensitivitymw package.  It is included so that the same function mscorev works for both the sensitivitymw and senstivitymv packages.  TonT is relevant only when the number of controls varies from one set to another.  See the help file for senmv in the sensitivitymv package for discussion of the TonT parameter.}
}

\value{
Generally, a matrix with the same dimensions as ymat containing the M-scores.
}
\references{
Rosenbaum, P. R. (2007) Sensitivity analysis for m-estimates, tests and confidence intervals in matched observational studies.  Biometrics, 2007, 63, 456-464.

Rosenbaum, P. R. (2014) Weighted M-statistics with superior design sensitivity in matched observational studies with multiple controls.  Journal of the American Statistical Association, 2014. DOI: 10.1080/01621459.2013.879261
}
\author{
Paul R. Rosenbaum
}

\note{
The example uses the mercury data set.  In particular, the first two rows of the mercury data were discussed in the final paragraph of Rosenbaum (2014, Section 2).
}

\examples{

data(mercury)
mercury[1:2,]
mscorev(mercury,trim=3)[1:2,]
}
