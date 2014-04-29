\name{senmwCI}
\alias{senmwCI}

\title{
Point estimate and confidence interval for sensitivity analysis in observational studies using weighted Huber-Maritz M-statistics.
}
\description{
	Obtains point estimates and confidence intervals by inverting the hypothesis test in senmw.  For instance, the confidence interval is the set of hypotheses not rejected by the test.  Estimates an additive treatment effect tau.  In a sensitivity analysis with gamma>1, one obtains an interval of point estimates consistent with a bias of at most gamma, and an interval containing all of the confidence intervals that are consistent with a bias of at most gamma.  Because senmwCI calls senmw many times, senmwCI is slower than senmw.
}
\usage{
senmwCI(y, gamma = 1, method = NULL, inner = 0, trim = 3, 
	 lambda = 1/2, m1=1, m2=1, m=1, alpha=0.05, 
	 one.sided=TRUE, tol=NULL, interval=NULL, detail=FALSE)
}

\arguments{
\item{y}{
If y is an n by J matrix, then: (i) the rows are n matched sets, (ii) the first column is the treated response in a set, columns 2 to J contain the responses of controls in the same matched set.  Every set must have J-1 controls, and NAs are not allowed in y.  If y is a vector, then y is the vector of treated-minus-control pair differences in outcomes in n=length(y) matched pairs.
}
\item{gamma}{
gamma is the sensitivity parameter, gamma=1 for a randomization test, gamma>1 for sensitivity bounds.  Use of gamma<1 will generate an error.  This parameter gamma is denoted by the upper case Greek letter gamma in the cited literature, for instance Rosenbaum (2007, 2014).
}
\item{method}{
	The method argument is the same as for the senmw function.  See the help file for senmw for more information.  Method="l" is not available for confidence intervals.
}
\item{inner}{Inner trimming to increase design sensitivity.  See the help file for senmw for more information.}
\item{trim}{Outer trimming for resistance to outliers.  See the help file for senmw for more information.}
\item{lambda}{Observations are scaled by the lambda quantile of the absolute pair differences.  See the help file for senmw for more information.}
\item{m1}{One of three parameters that determine the weights.  See the discussion of m below.}
\item{m2}{One of three parameters that determine the weights.  See the discussion of m below.}
\item{m}{One of three parameters that determine the weights.  See the help file for senmw for more information.  m2<m is not available for confidence intervals.} 
\item{alpha}{1-alpha is the coverage of the confidence interval.}
\item{one.sided}{If TRUE, the confidence interval is one sided.  If FALSE, the confidence interval is two-sided.  The default is one-sided.}
\item{tol}{The senmwCI function calls the R function uniroot, and tol is the tol (or tolerance) parameter in that call.  If tol=NULL, senmwCI picks a reasonable tolerance.}
\item{interval}{The senmwCI function calls the R function uniroot, and interval is the interval parameter in that call.  If interval=NULL, senmwCI picks a reasonable interval.}
\item{detail}{If detail=FALSE, the interval of point estimates and the confidence interval are reported after rounding based on tol.  If detail=TRUE, then the results are not rounded, the tol and interval are reported.}
}

\value{
\item{PointEstimate}{An interval of point estimates allowing for a bias of gamma in treatment assignment.  Rounded if detail=FALSE.}
\item{CI}{An confidence interval allowing for a bias of gamma in treatment assignment.  Rounded if detail=FALSE.}
\item{search.interval}{If detail=TRUE, the interval of parameter values searched to find the estimates and confidence intervals.}
\item{tolerance}{If detail=TRUE, the tolerance used in solving for estimates and confidence intervals.}
}

\references{
Main references:

Rosenbaum, P. R. (2007) Sensitivity analysis for m-estimates, tests and confidence intervals in matched observational studies.  Biometrics, 2007, 63, 456-464.  Discusses the unweighted statistics.

Rosenbaum, P. R. (2014) Weighted M-statistics with superior design sensitivity in matched observational studies with multiple controls.  Journal of the American Statistical Association, 2014. DOI: 10.1080/01621459.2013.879261  This paper is the main reference for weighted M-statistics and for the sensitivitymw package.

}
\author{
Paul R. Rosenbaum
}

\note{
senmwCI inverts a test to obtain confidence intervals and point estimats; so, it calls senmw many times, solving several equations, and senmwCI is much slower than a single call to senmw.  senmwCI finds point estimates and confidence intervals by searching for a value of the parameter tau in "interval" determining the solution tau.hat to an estimating equation with an error of "tol" in solving the equation.  If interval=NULL and tol=NULL, senmwCI tries to pick a reasonable finite interval and tol>0.  If concerned about these "reasonable values", set detail=TRUE, make the interval longer, the tol smaller, and wait longer for program to run.  As illustrated in the examples, if there is reason for concern, the solutions produced by senmwCI can be checked by running senmw with tau set to the endpoints of the various intervals. 

Unlike senmw, senmwCI does not permit redescending rank scores, m2<m or method="l". 
}



\examples{
data(mercury)
senmwCI(mercury,gamma=2,method="w",one.sided=FALSE,detail=TRUE)

#The following example reproduces part of Table 1 in Rosenbaum (2007).  
#In particular, the one-sided .95 confidence interval is tau >= 0.1812, 
#and the P-value testing tau=0.1812 is 0.05.  
#Similarly, the test statistic equals its null expectation at tau=0.3403, 
#and when evaluated at -yrpcp the same thing happens at tau=-0.6666.
data(erpcp)
senmwCI(erpcp,gamma=2,trim=1,m1=1,m2=1,m=1)
senmw(erpcp,gamma=2,trim=1,m1=1,m2=1,m=1,tau=0.1812)
senmw(erpcp,gamma=2,trim=1,m1=1,m2=1,m=1,tau=0.3403)
senmw(-erpcp,gamma=2,trim=1,m1=1,m2=1,m=1,tau=-0.6666)


#This example illustrates the relationship between senmwCI and senmw.  
#Note that the endpoints from senmwCI are tested by senmw.  
#Also for illustration, the search interval in this case is specified as from 0 to 5.
senmwCI(mercury,gamma=2,method="w",detail=TRUE,interval=c(0,5),one.sided=FALSE)
senmw(mercury,gamma=2,method="w",tau=2.03135)
senmw(-mercury,gamma=2,method="w",tau=-3.166710)
senmw(mercury,gamma=2,method="w",tau=1.775008)
senmw(-mercury,gamma=2,method="w",tau=-3.605779)
}
