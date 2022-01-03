\name{newurks}
\alias{newurks}

\title{
	Approximate scores for ranks of row ranges.
}
\description{
	Of limited interest to most users, this function is called by senmw.  The function calculates the ranges for each row of smat, scores their ranks using the large sample approximation to a rank score transformation in Lemma 1, expression (9) of Rosenbaum (2011), as implemented in the function multrnks, and multiplies the rows by these rank scores.  Additional detail is found in the help file for multrnks.
}
\usage{
newurks(smat, m1 = 2, m2 = 2, m = 2)
}
\arguments{
  \item{smat}{
	A matrix.  When called by senmv, smat is a matrix produced by mscorev.
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
	The function calculates the ranges for each row of smat, scores the ranks of the ranges using the large sample approximation to a rank score transformation in Lemma 1, expression (9) of Rosenbaum (2011), as implemented in the function multrnks, and multiplies the rows of smat by these rank scores, returning the result.
}
\references{
	Rosenbaum, P. R. (2011) A new u-statistic with superior design sensitivity in matched observational studies.  Biometrics 67, 1017-1027.
<doi:10.1111/j.1541-0420.2010.01535.x>

	Rosenbaum, P. R. (2014) Weighted M-statistics with superior design sensitivity in matched observational studies with multiple controls.  Journal of the American Statistical Association, 109(507), 1145-1158.
<doi:10.1080/01621459.2013.879261>
}
\author{
	Paul R. Rosenbaum
}

\examples{
	data(mercury)
 	head(newurks(mscorev(mercury)))
}
