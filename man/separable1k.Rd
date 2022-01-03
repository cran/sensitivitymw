\name{separable1k}
\alias{separable1k}
\concept{Asymptotic separability}
\title{
Asymptotic separable calculations internal to other functions.
}
\description{
This general purpose function is internal to other functions, such as senmw in the sensitivitymw package.  The function performs the asymptotic separable calculations described in Gastwirth, Krieger and Rosenbaum (2000), as used in section 4 of Rosenbaum (2007); see Rosenbaum (2018) for additional theory associated with this approximation.  The example is equivalent to senmw(mercury,gamma=2,method="t").  The function separable1k in the sensitivitymw package and the function separable1v in sensitivitymv package should give the same answer when applied to matched sets with a fixed number of controls; however, separable1k is faster as a consequence of not allowing variable numbers of controls.  Speed is important when senmwCI calls senmw repeatedly to obtain a confidence set by inverting a test.
}
\usage{
separable1k(ymat, gamma = 1)
}
\arguments{
  \item{ymat}{
ymat is a matrix whose rows are matched sets and whose columns are matched individuals.  The first column describes treated individuals.  Other columns describe controls. Every set must have 1 treated subject and dim(ymat)[2]-1 controls.  NAs are not allowed.  For variable numbers of controls, see the separable1v function in the sensitivitymv package.
}
  \item{gamma}{
gamma is the value of the sensitivity parameter; see the documentation for the senmw function in the sensitivitymw package.  One should use a value of gamma >= 1.
}
}

\value{
\item{pval}{Approximate upper bound on the one-sided P-value.}
\item{deviate}{Deviate that is compared to the upper tail of the standard Normal distribution to obtain the P-value.}
\item{statistic}{Value of the test statistic.}
\item{expectation}{Maximum null expectation of the test statistic for the given value of gamma.}
\item{variance}{Among null distributions that yield the maximum expectation, variance is the maximum possible variance for the given value of gamma.  See Rosenbaum (2007, Section 4) and Gastwirth, Krieger and Rosenbaum (2000).}
}

\references{
Gastwirth, J. L., Krieger, A. M., and Rosenbaum, P. R. (2000) Asymptotic separability in sensitivity analysis.  Journal of the Royal Statistical Society B 2000, 62, 545-556.<doi:10.1111/1467-9868.00249>

Rosenbaum, P. R. (2007) Sensitivity analysis for m-estimates, tests and confidence intervals in matched observational studies.  Biometrics, 2007, 63, 456-464. <doi:10.1111/j.1541-0420.2006.00717.x>

Rosenbaum, P. R. (2018). Sensitivity analysis for stratified comparisons in an observational study of the effect of smoking on homocysteine
levels. The Annals of Applied Statistics, 12(4), 2312-2334.
<doi:10.1214/18-AOAS1153>
}

\author{
Paul R. Rosenbaum
}

\examples{
data(mercury)
separable1k(mercury,gamma=2)
senmw(mercury,method="t",gamma=2)
}
