\name{sensitivitymw-package}
\alias{sensitivitymw-package}
\alias{sensitivitymw}
\docType{package}
\title{
\packageTitle{sensitivitymw}
}
\description{
\packageDescription{sensitivitymw}
}
\details{

The DESCRIPTION file:
\packageDESCRIPTION{sensitivitymw}
\packageIndices{sensitivitymw}
The two most important functions are senmw and senmwCI; they perform, respectively, sensitivity analyses for hypothesis tests and for confidence intervals.   Rosenbaum (2015) illustrates the use of this package and compares it with alternative methods.  The package requries that each treated individual be matched to the same number of controls, say 1-to-1 or 1-to-2.  The packages
sensitivitymv, sensitivitymult and sensitivityfull permit variable numbers of controls, but they use unweighted M-statistics.  The package sensitivitymult has unweighted M-statistics in what may be a more convenient format for data input -- matched sets are defined by a variable rather than a matrix structure.  The package senstrat uses strata instead of matched sets; see Rosenbaum (2021, sec. 2.3) for an example of combining robust covariance adjustment and stratification in sensitivity analysis, with data from the evident package.
}
\author{
\packageAuthor{sensitivitymw}

Maintainer: \packageMaintainer{sensitivitymw}
}
\references{
Huber, P. (1981) Robust Statistics.  New York: Wiley, 1981.

Maritz, J. S. (1979) Exact robust confidence intervals for location.  Biometrika 1979, 66, 163-166. <doi:10.1093/biomet/66.1.163>

Rosenbaum, P. R. (2014) Weighted M-statistics with superior design sensitivity in matched observational studies with multiple controls.  Journal of the American Statistical Association, 109(507), 1145-1158
<doi:10.1080/01621459.2013.879261>

Rosenbaum, P. R. (2015). Two R packages for sensitivity analysis in observational studies. Observational Studies, 1(2), 1-17.  The Observational Studies journal is available free on-line.
<10.1353/obs.2015.0000>

Rosenbaum, P. R. (2007) Sensitivity analysis for m-estimates, tests and confidence intervals in matched observational studies.  Biometrics, 2007, 63, 456-464. <doi:10.1111/j.1541-0420.2006.00717.x>

Rosenbaum, P. R. (2013) Impact of multiple matched controls on design sensitivity in observational studies.  Biometrics, 2013, 69, 118-127.
<doi:10.1111/j.1541-0420.2012.01821.x>

Rosenbaum, P. R. (2018). Sensitivity analysis for stratified comparisons in an observational study of the effect of smoking on homocysteine
levels. The Annals of Applied Statistics, 12(4), 2312-2334.
<doi:10.1214/18-AOAS1153>

Rosenbaum, P. R. (2021). Replication and Evidence Factors in Observational Studies. Chapman and Hall/CRC.<doi:10.1201/9781003039648>
}

\keyword{ package }

\examples{
data(mercury)
senmw(mercury,gamma=15)
}
