\name{senmw}
\alias{senmw}

\title{
Sensitivity analysis in observational studies using weighted Huber-Maritz M-statistics.
}
\description{
Computes the large sample approximation to the upper bound on the one sided P-value testing the null hypothesis of no treatment effect in a matched observational study with a fixed number of controls matched to each treated subject.  Uses an unweighted or a weighted version of Huber-Maritz M-statistics as test statistics, with weights proposed by Rosenbaum (2014).  Under many simple models for treatment effects, weighted M-statistics have superior design sensitivity compared to unweighted M-statistics.

For confidence intervals and point estimates, use the senmwCI function rather than senmw.

The senmw function requires every treated subject to have the same number of matched controls, e.g., 2 controls matched to each treated subject.  If your study has variable numbers of controls matched to treated subjects, consider using senmv in the sensitivitymv package.

The senmw function offers a wide choice of test statistics obtained by varying its arguments.  The default is an unweighted M-test using Huber's psi-function, and it is equivalent to method = "h".  The default is safe to use in all contexts, but it is expected to report greater sensitivity to bias than other methods in many contexts: therefore, for matched pairs, method="p" is suggested; and for matched sets with 2 to 4 controls per set, method="w" is suggested.  See below and the references for additional options and discussion.

The one-sided alternative hypothesis is that treatment increases the level of response.  See the notes for discussion of other situations.
}
\usage{
senmw(y, gamma = 1, method = NULL, inner = 0, trim = 3, 
     
	 lambda = 1/2, tau = 0, m1=1, m2=1, m=1)
}

\arguments{
  \item{y}{
If y is an n by J matrix, then: (i) the rows are n matched sets, (ii) the first column is the treated response in a set, columns 2 to J contain the responses of controls in the same matched set.  Every set must have J-1 controls, and NAs are not allowed in y.  If y is a vector, then y is the vector of treated-minus-control pair differences in outcomes in n=length(y) matched pairs.
}
  \item{gamma}{
gamma is the sensitivity parameter, gamma=1 for a randomization test, gamma>1 for sensitivity bounds.  Use of gamma<1 will generate an error.  This parameter gamma is denoted by the upper case Greek letter gamma in the cited literature, for instance Rosenbaum (2007, 2014).
}
  \item{method}{
If method is NULL, then the method is determined by the parameters, namely inner, trim, lambda, m1, m2, and m.  If method is not NULL, then these parameters are set according to the selected method and stated values of the parameters are ignored.  The default values of the parameters are equivalent to method="h".

(i) method = "h" (Huber, unweighted) is unweighted and sets inner=0, trim=3, lambda = 1/2, m1=m2=m=1.  Method "h" is equivalent to the default settings.  Its psi function levels off at 3 times the median (lambda = 1/2) of the absolute pair differences.  The unweighted method h is often a good choice in small samples with few pairs or sets (say 20 sets).  Unweighted method h is often a reasonable choice when the number of controls in each matched set is 6 or more.  (Method "h" is almost the same as the default method for the senmv function in the sensitivitymv package, except: (a) senmv permits variable numbers of controls, (b) senmv uses trim = 2.5, not trim = 3.)

(ii) method = "w" (weighted).  Method "w" sets inner=0, trim=3, lambda=1/2, m1=12, m2=20, m=20.  These weights are sturdy, all-purpose weights, often better than method="h" with 2-4 controls per matched set.  Method="s" will often perform better for short-tailed Normal errors and method="l" will often perform better for long-tailed errors such as the t with 4 degrees of freedom.

(iii) method = "f" (fixed choice weights).  Method "f" sets inner=0, trim=3, lambda=1/2, m1=14, m2=20, m=20.  Similar to method="w", method="f" uses all-purpose weights that were suggested, based on various calculations, in section 7.2 of Rosenbaum (2014) as the choice of a person who wants a "fixed choice" of weights.

(iv) method = "s" (weighted for short tails) has weights appropriate for short tailed distributions, such as the Normal distribution.  Method "s" sets inner=0, trim=3, lambda=1/2, m1=16, m2=20, m=20.

(v) method = "l" (i.e., lower case letter L, weighted for long tails) has weights appropriate for long tailed distributions, such as the t-distribution with 4 degrees of freedom.  It sets inner=0, trim=3, lambda=1/2, m1=12, m2=19, m=20.  These weights redescend.  The senmwCI function does not permit weights that redescend, and in particular does not permit method = "l".

(vi) method = "q" (Quade) ranks sets using ordinary ranks (1, 2, ..., n) applied to ranges of M-scores within sets, in parallel with Quade (1979) and Tardiff (1987).  It sets inner=0, trim=3, lambda=1/2, m1=2, m2=2, m=2.

(vii) method = "t" (permutational t-test) is unweighted and permutes the observations themselves without ranking or scoring.  It sets inner=0, trim=Inf, lambda=1/2, m1=m2=m=1.  The history of the permutational t-test is discussed in the help file for the senmv function in the sensitivitymv package.  Method "t" is the permutation test that uses the treated-minus-control difference in means as a test statistic.

(viii) method = "p" (pairs) is primarily intended for matched pairs, with just one matched control.  It is unweighted but uses inner trimming, and it sets inner = 1/2, trim =2, lambda = 1/2, m1=m2=m=1.  This method performs well for matched pairs, as seen in the evaluations in Tables 3, 4 and 5 of Rosenbaum (2013) where it is psi_in with K=2 for pairs.
}
  \item{inner}{
Inner trimming to increase design sensitivity.  See the discussion of lambda.  Use of inner<0 or inner>trim will generate an error.  Inner trimming is discussed in Rosenbaum (2013).
}
  \item{trim}{
Outer trimming for resistance to outliers.  Setting trim = Inf does no trimming.  See the discussion of lambda.
}
  \item{lambda}{
Observations are scaled by the lambda quantile of the absolute pair differences, defaulting to the median of all paired absolute differences; see Rosenbaum (2007, section 4.2) for a precise definition in the case of multiple controls.  If the lambda quantile of the absolute pair differences is 0, then scaling by 0 is impossible and an error may result; the solution is to increase lambda.  If qu is the lambda quantile, absolute pair differences smaller than inner*qu receive weight 0, absolute pair differences larger than qu*trim receive weight 1, and between inner*qu and trim*qu weights increase linearly from 0 to 1.  Use of lambda<=0 or lambda>=1 will generate an error.  If inner=0 and trim=Inf, then this results in the permutational t-test in which the observations themselves are permuted, and in this case lambda is not used.  Taking lambda = .95 and trim = 1 is similar to trimming 5 percent of the pair differences.
}
\item{tau}{
If tau=0, senmw tests the null hypothesis of no treatment effect.  If tau is not 0, senmw tests the null hypothesis that the treatment effect is an additive shift of tau against the alternative that the effect is larger than tau.
}

\item{m1}{One of three parameters that determine the weights.  See the discussion of m below.}

\item{m2}{One of three parameters that determine the weights.  See the discussion of m below.}

\item{m}{One of three parameters that determine the weights.  If in doubt about (m1,m2,m), then sensible sturdy choices are method="p" for matched pairs and method="w" for sets with 2 to 4 controls.  Properties of different weights (m,m1,m2) are discussed in Rosenbaum (2014, sections 4 and 5).  Details follow.  The triple (m,m1,m2) determines the weights, essentially as in expression (5) in Rosenbaum (2014) or expression (8) in Rosenbaum (2011) where they are called m (for m), underline(m) for m1, and overline(m) for m2. In particular, (m,m1,m2)=(1,1,1) is unweighted.  (m,m1,m2)=(2,2,2) are (essentially) conventional ranks, as in method="q".  Method="w" has (m,m1,m2)=(20,12,20) for increasing rank scores that ignore sets with little dispersion.  If m>m2, as in (m,m1,m2)=(20,12,19) for method="l", the scores are redescending.  The function semwCI for confidence intervals and estimates does not permit redescending weights, m2<m.}

}

\value{
\item{pval}{Approximate upper bound on the one-sided P-value.}
\item{deviate}{Deviate that is compared to the upper tail of the standard Normal distribution to obtain the P-value.}
\item{statistic}{Value of the test statistic.}
\item{expectation}{Maximum null expectation of the test statistic for the given value of gamma.}
\item{variance}{Among null distributions that yield the maximum expectation, variance is the maximum possible variance for the given value of gamma.  See Rosenbaum (2007, Section 4; 2014) and Gastwirth, Krieger and Rosenbaum (2000).}
}

\references{
Main references:

Rosenbaum, P. R. (2007) Sensitivity analysis for m-estimates, tests and confidence intervals in matched observational studies.  Biometrics, 2007, 63, 456-464.  Discusses the unweighted statistics.

Rosenbaum, P. R. (2013) Impact of multiple matched controls on design sensitivity in observational studies.  Biometrics, 2013, 69, 118-127.  Evaluates the performance of the methods in the 2007 paper above.  In particular, this paper compares methods h, p and t.

Rosenbaum, P. R. (2014) Weighted M-statistics with superior design sensitivity in matched observational studies with multiple controls.  Journal of the American Statistical Association, 2014. DOI: 10.1080/01621459.2013.879261  This paper is the main reference for weighted M-statistics and for the sensitivitymw package.  It evaluates weights controlled by m1, m2 and m.

---------------------------------------


Additional references:

Huber, P. (1981) Robust Statistics.  New York: Wiley, 1981.  Huber first proposed the use of m-statistics in 1964 in a paper in the Annals.

Maritz, J. S. (1979) Exact robust confidence intervals for location.  Biometrika 1979, 66, 163-166.  Proposed exact permutation tests using m-statistics that Maritz inverts to obtain exact confidence limits.  The subtle aspect is the scaling which must be invariant to treatment assignment under the null hypothesis, so it differs from the scaling used by Huber.

Gastwirth, J. L., Krieger, A. M., and Rosenbaum, P. R. (2000) Asymptotic separability in sensitivity analysis.  Journal of the Royal Statistical Society B 2000, 62, 545-556.  Provides a general large sample approximation when matching with multiple controls, as used in Rosenbaum (2007, Section 4).

Quade, D. (1979) Using weighted rankings in the analysis of complete blocks with additive block effects.  Journal of the American Statistical Association 1979, 74, 680-683.  Weights within block ranks by ranks of within block ranges to increase efficiency in randomized experiments.

Rosenbaum, P. R. (2010) Design of Observational Studies.  New York: Springer 2010.  Section 2.9 contains an elementary textbook discussion of Maritz's permutation distribution for m-statistics.

Rosenbaum, P. R. (2011) A new u-statistic with superior design sensitivity in observational studies.  Biometrics 2011, 67, 1017-1021.  Introduced the (m,m1,m2) weights in the context of signed rank statistics.

Tardiff, S. (1987) Efficiency and optimality results for tests based on weighted rankings.  Journal of the American Statistical Association 1987, 82, 637-644.  Extends the study of Quade's (1979) method.
}
\author{
Paul R. Rosenbaum
}

\note{
The one-sided alternative hypothesis is that treatment increases the level of response.  Apply senmw to -y to test against the alternative that the treatment decreases the level of response.  One way to perform a two sided test is to perform both tests and double the smaller P-value bound.
  
When a study has a fixed number of controls, the senmw function may be used in place of the senmv function in the sensitivitymv package, and senmw will be faster (because separable1k in sensitivitymw for fixed controls is faster than separable1v in sensitivitymv for variable controls).  The senmw function may be used in conjunction with the following functions from the sensivitymv package: amplify, truncatedP and truncatedPbg.

The example mercury is from Rosenbaum (2014) and compares the mercury levels in the blood of individuals who ate 15 or more servings of fish or shellfish in the previous month to people who ate at most one serving.  Data are from NHANES.

Consistent with theory, in the example, the weighted M-statistics report greater insensitivity to unmeasured biases than do unweighted M-statistics.  For example, unweighted method="h" and unweighted m1=1,m2=1,m=1 yield p-values above 0.05 for gamma=15, but weighted method="w" yields a p-value below 0.05 for gamma=19.

Row gamma=15 in Table 2 of Rosenbaum (2014) is reproduced by the example below with various values of m1<=m2<=m.  

For numerical stability in large problems, senmw function uses approximate weights (expression (9) in Rosenbaum (2011)) rather than exact weights (expression (8) in Rosenbaum (2011) and expression (5) in Rosenbaum (2014)), so senmw produces ever so slightly different p-value bounds than reported in Table 2 of Rosenbaum (2014).  If you are interested in this distinction between approximate and exact rank scores (it isn't really very interesting), the calculation occurs in the multrnks function, so type help(multrnks).  
}



\examples{
#Illustrates greater insensitivity reported when weights are use.
data(mercury)
senmw(mercury,gamma=15)
senmw(mercury,method="h",gamma=15)
senmw(mercury,method="w",gamma=15)
senmw(mercury,method="w",gamma=19)
senmw(mercury,method="l",gamma=20)

#Reproduces Table 2, row gamma=15 of Rosenbaum (2014).  
senmw(mercury,gamma=15,m1=1,m2=1,m=1)
senmw(mercury,gamma=15,m1=2,m2=2,m=2)
senmw(mercury,gamma=15,m1=12,m2=20,m=20)
senmw(mercury,gamma=15,m1=14,m2=20,m=20)
senmw(mercury,gamma=15,m1=16,m2=20,m=20)
senmw(mercury,gamma=15,m1=12,m2=19,m=20)
senmw(mercury,gamma=15,m1=14,m2=19,m=20)
senmw(mercury,gamma=15,m1=16,m2=19,m=20)

#Reproduces part of Table 1 in Rosenbaum (2007).  For other parts of this table, see help(senmwCI).
data(erpcp)
senmw(erpcp,gamma=2,trim=1,inner=0,m1=1,m2=1,m=1)
senmw(erpcp,gamma=3,trim=1,inner=0,m1=1,m2=1,m=1)
senmw(erpcp,gamma=4,trim=1,inner=0,m1=1,m2=1,m=1)
}
