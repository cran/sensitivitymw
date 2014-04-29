\name{multrnks}
\alias{multrnks}
\title{
	Approximate scores for ranks.
}
\description{
	Of limited interest to most users, this function is called by senmw.  The function calculates the large sample approximation to a rank score transformation in Lemma 1, expression (9) of Rosenbaum (2011).  
	
	For numerical stability in large problems, the approximate rank score transformation in expression (9) of Rosenbaum (2011) is used in place of the exact rank score transformation in expression (8) of Rosenbaum (2011) and expression (5) of Rosenbaum (2014).  Exact and approximate rank scores yield similar bounds on P-values.  The exact rank scores involve very large combinatorial coefficiences when the same size is very large, whereas the nearly equivalent approximate scores do not.
}
\usage{
multrnks(rk, m1 = 2, m2 = 2, m = 2)
}
\arguments{
  \item{rk}{
	A vector of ranks that may include average ranks for ties.
}
  \item{m1}{
	One of three rank score parameters in Rosenbaum (2011, 2014), specifically m1 = underline(m).
}
  \item{m2}{
	One of three rank score parameters in Rosenbaum (2011, 2014), specifically m2 = overline(m).
}
  \item{m}{
	One of three rank score parameters in Rosenbaum (2011, 2014), specifically m = m.
}
}

\value{
	Vector of length(rk) containing the scores for the ranks in rk.
}
\references{
	Rosenbaum, P. R. (2011) A new u-statistic with superior design sensitivity in matched observational studies.  Biometrics 67, 1017-1027.
	
	Rosenbaum, P. R. (2014) Weighted M-statistics with superior design sensitivity in matched observational studies with multiple controls.  Journal of the American Statistical Association, 2014. DOI: 10.1080/01621459.2013.879261
}
\author{
	Paul R. Rosenbaum
}

\examples{
	multrnks(1:10)
	multrnks(1:10,m1=12,m2=20,m=20)
}

