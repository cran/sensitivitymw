\name{mercury}
\alias{mercury}
\concept{Observational study}
\docType{data}
\title{
NHANES Mercury/Fish Data
}
\description{
Data from NHANES.  Matrix 397 x 3.  n=397 treated people who ate at least 15 servings of fish or shellfish during the previous month are matched to two controls who ate at most one serving of fish or shellfish.  The values in mercury record the level of  methylmercury in blood in mu-g/dl.  Column 1 is treated, columns 2 and 3 are controls.  Specifically, column 2 describes an individual who ate no fish or shellfish in the previous month, while column 3 describes an individual who ate exactly one serving of fish or shellfish.  The data are also used to illustrate the senmv function in the sensitivitymv package.
}
\usage{data(mercury)}
\format{
  A data frame with 397 observations on the following 3 variables.
  \describe{
    \item{\code{Treated}}{Mercury level for treated individual.}
    \item{\code{Zero}}{Mercury level for a control who ate no fish/shellfish}
    \item{\code{One}}{Mercury level for a control who ate one serving of
fish/shellfish}
  }
}

\source{
Data are originally from NHANES 2009-2010.

Data were used as an example in: Rosenbaum, P. R. (2014) Weighted M-statistics with superior design sensitivity in matched observational studies with multiple controls.  Journal of the American Statistical Association, 109(507), 1145-1158 <doi:10.1080/01621459.2013.879261>
}

\examples{
data(mercury)
}
\keyword{datasets}
