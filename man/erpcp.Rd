\name{erpcp}
\alias{erpcp}
\concept{Observational study}
\docType{data}
\title{
DNA Damage Among Welders
}
\description{
Matched pairs of a welder and a control, matching for age and smoking.  The values are DNA elution rates through polycarbonate filters with proteinase K (or erpcp).  Data are originally from Werfel et al. (1998) and were used as an example in Rosenbaum (2007).  Data are used to illustrate the senmwCI function in the sensitivitymw package.
}
\usage{data(erpcp)}
\format{
  A data frame with 39 observations on the following 2 variables.
  \describe{
    \item{\code{welder}}{erpcp value for the welder}
    \item{\code{control}}{erpcp value for the matched control}
  }
}

\source{
Werfel et al. (1998).
}
\references{
Rosenbaum, P. R. Sensitivity analysis for m-estimates, tests and confidence intervals in matched observational studies.  Biometrics, 2007, 63, 456-464.

Werful, U., Langen, V., Eickhoff, I. et al. Elevated DNA strand breakage frequencies in lymphocytes of welders exposed to chromium and nickel.  Carcinogenesis, 1998, 19, 413-418.
}
\examples{
data(erpcp)
}
\keyword{datasets}
