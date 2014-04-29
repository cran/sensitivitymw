\name{sensitivitymw-package}
\alias{sensitivitymw-package}
\alias{sensitivitymw}
\docType{package}
\title{
Sensitivity analysis for observational studies using weighted M-statistics.
}
\description{
Sensitivity analysis for tests, confidence intervals and estimates in matched observational studies with multiple controls using weighted or unweighted Huber-Maritz M-tests (including the permutational t-test).
}
\details{
\tabular{ll}{
Package: \tab sensitivitymw\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2013-11-03\cr
License: GPL-2
LazyLoad: \tab yes\cr
}
The sensitivitymw package performs sensitivity analyses in matched observational studies with multiple controls using weighted Huber-Maritz M-tests, as proposed in Rosenbaum (2014).  Function senmw provides bounds on P-values and function senmwCI provides confidence intervals and point estimates.  Package sensitivitymw is a companion to package sensitivitymv, and in particular the functions amplify, truncatedP and tuncatedPbg in sensitivitymv are useful when using function senmw in the sensitivitymw package.  Package sensitivitymw applies weights to matched sets to increase design sensitivity, whereas sensitivitymv does not use weights.  However, package sensitivitymv may be used with variable numbers of controls, whereas sensitivitymw requires a fixed number, say 2 controls for each treated subject.

The sensitivity analysis asks about the magnitude, gamma, of bias in treatment assignment in observational studies that would need to be present to alter the conclusions of a randomization test that assumed matching for observed covariates removes all bias.  The method implemented in sensitivitymw is essentially the method described in Rosenbaum (2014); see also Rosenbaum (2007, 2013).  For general discussion of senstivity analyses in observational studies, see Chapter 4 of Rosenbaum (2002).

The main functions in the sensitivitymw package are senmw and senmwCI.  Therefore, type help(senmw) and help(senmwCI).

Data set "mercury" is from NHANES and was used as an example in Rosenbaum (2014).  Data set "erpcp" is from Werful et al. (1998) and was used as an example in Rosenbaum (2007).  See the help files for these data sets for more information.  The examples in senmw reproduce some calculations from Table 2 of Rosenbaum (2014), and the examples in senmwCI reproduce some of the calculations in Table 1 of Rosenbaum (2007).
}
\author{
Paul Rosenbaum

Maintainer: Paul R. Rosenbaum <rosenbaum@wharton.upenn.edu>

}
\references{

Huber, P. (1981) Robust Statistics.  New York: Wiley, 1981.

Maritz, J. S. (1979) Exact robust confidence intervals for location.  Biometrika 1979, 66, 163-166.

Rosenbaum, P. R. (2002) Observational Studies (2nd edition).  New York: Springer.

Rosenbaum, P. R. (2007) Sensitivity analysis for m-estimates, tests and confidence intervals in matched observational studies.  Biometrics, 2007, 63, 456-464.

Rosenbaum, P. R. (2013) Impact of multiple matched controls on design sensitivity in observational studies.  Biometrics, 2013, 69, 118-127.

Rosenbaum, P. R. (2014) Weighted M-statistics with superior design sensitivity in matched observational studies with multiple controls.  Journal of the American Statistical Association, 2014. DOI: 10.1080/01621459.2013.879261

Werful, U., Langen, V., Eickhoff, I. et al. Elevated DNA strand breakage frequencies in lymphocytes of welders exposed to chromium and nickel.  Carcinogenesis, 1998, 19, 413-418.
}

\keyword{ package }