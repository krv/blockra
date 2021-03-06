% Generated by roxygen2 (4.1.0.9001): do not edit by hand
% Please edit documentation in R/rearrangepartition.r
\name{rearrangepartition}
\alias{rearrangepartition}
\title{Rearrange matrix based on binary partition vector}
\usage{
rearrangepartition(X, partition, fix.first = TRUE)
}
\arguments{
\item{X}{numeric array or matrix}

\item{partition}{binary partition vector with 1 representing block 1
and 0 representing block 2}

\item{fix.first}{don't change the order of the first column}
}
\value{
numeric matrix with a minimal row sum variance
}
\description{
Rearrange matrix based on binary partition vector
}
\author{
Kris Boudt, \email{kris.boudt@vub.ac.be}

Steven Vanduffel, \email{steven.vanduffel@vub.ac.be}

Kristof Verbeken, \email{kristof.verbeken@vub.ac.be}
}

