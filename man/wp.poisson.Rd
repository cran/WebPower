% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/webpower.R
\name{wp.poisson}
\alias{wp.poisson}
\title{Statistical Power Analysis for Poisson Regression}
\usage{
wp.poisson(n = NULL, exp0 = NULL, exp1 = NULL, alpha = 0.05,
  power = NULL, alternative = c("two.sided", "less", "greater"),
  family = c("Bernoulli", "exponential", "lognormal", "normal", "Poisson",
  "uniform"), parameter = NULL, subdivisions=200L,
  i.method=c("numerical", "MC"), mc.iter=20000)
}
\arguments{
\item{n}{Sample size.}

\item{exp0}{The base rate under the null hypothesis. It always takes positive value. See the article by \cite{Demidenko (2007)} for details.}

\item{exp1}{The relative increase of the event rate. It is used for calculatation of the effect size. See the article by \cite{Demidenko (2007)} for details.}

\item{alpha}{significance level chosed for the test. It equals 0.05 by default.}

\item{power}{Statistical power.}

\item{alternative}{Direction of the alternative hypothesis (\code{"two.sided"} or \code{"less"} or \code{"greater"}). The default is "two.sided".}

\item{family}{Distribution of the predictor (\code{"Bernoulli"},\code{"exponential"},
\code{"lognormal"}, \code{"normal"}, \code{"Poisson"}, \code{"uniform"}). The default is "Bernoulli".}

\item{parameter}{Corresponding parameter for the predictor's distribution.
The default is 0.5 for "Bernoulli", 1 for "exponential", (0,1) for "lognormal" or "normal", 1 for "Poisson", and (0,1) for "uniform".}
\item{subdivisions}{Number of divisions for integration}
\item{i.method}{Integration method}
\item{mc.iter}{Number of iterations for Monte Carlo integration}
}
\value{
An object of the power analysis.
}
\description{
This function is for Poisson regression models. Poisson regression is a type of generalized linear models where the outcomes are usually count data. 
Here, Maximum likelihood methods is used to estimate the model parameters. The estimated regression coefficent is assumed to follow a normal distribution.
A Wald test is used to test the mean difference between the estimated parameter and the null parameter (tipically the null hypothesis assumes it equals 0).
The procedure introduced by \cite{Demidenko (2007)} is adopted here for computing the statistical power.
}
\examples{
\donttest{
#To calculate the statistical power given sample size and effect size:
wp.poisson(n = 4406, exp0 = 2.798, exp1 = 0.8938, alpha = 0.05,
                 power = NULL, family = "Bernoulli", parameter = 0.53)
#  Power for Poisson regression
#
#       n     power alpha  exp0   exp1    beta0      beta1 paremeter
#    4406 0.9999789  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#
#  URL: http://psychstat.org/poisson

#To generate a power curve given a sequence of sample sizes:
res <- wp.poisson(n = seq(800, 1500, 100), exp0 = 2.798, exp1 = 0.8938,
      alpha = 0.05, power = NULL, family = "Bernoulli", parameter = 0.53)
res
#  Power for Poisson regression
#
#       n     power alpha  exp0   exp1    beta0      beta1 paremeter
#     800 0.7324097  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#     900 0.7813088  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#    1000 0.8224254  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#    1100 0.8566618  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#    1200 0.8849241  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#    1300 0.9080755  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#    1400 0.9269092  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#    1500 0.9421344  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#
#  URL: http://psychstat.org/poisson

#To plot the power curve:
plot(res) 

#To calculate the required sample size given power and effect size:
wp.poisson(n = NULL, exp0 = 2.798, exp1 = 0.8938, alpha = 0.05,
            power = 0.8, family = "Bernoulli", parameter = 0.53)
#  Power for Poisson regression
#
#           n power alpha  exp0   exp1    beta0      beta1 paremeter
#    943.2628   0.8  0.05 2.798 0.8938 1.028905 -0.1122732      0.53
#
#  URL: http://psychstat.org/poisson
}

}
\references{
Demidenko, E. (2007). Sample size determination for logistic regression revisited. Statistics in medicine, 26(18), 3385-3397.

Zhang, Z., & Yuan, K.-H. (2018). Practical Statistical Power Analysis Using Webpower and R (Eds). Granger, IN: ISDSA Press.
}
