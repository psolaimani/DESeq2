% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lfcShrink.R
\name{lfcShrink}
\alias{lfcShrink}
\title{Shrink log2 fold changes}
\usage{
lfcShrink(dds, coef, contrast, res, type = "normal")
}
\arguments{
\item{dds}{a DESeqDataSet object, which has been run through
\code{\link{DESeq}}, or at the least, \code{\link{estimateDispersions}}}

\item{coef}{the number of the coefficient (LFC) to shrink,
consult \code{resultsNames(dds)} after running \code{DESeq(dds, betaPrior=FALSE)}.
only \code{coef} or \code{contrast} can be specified, not both}

\item{contrast}{see argument description in \code{\link{results}}.
only \code{coef} or \code{contrast} can be specified, not both}

\item{res}{a DESeqResults object (can be missing)}

\item{type}{at this time, ignored argument, because only one
shrinkage estimator, but more to come!}
}
\value{
if \code{res} is not missing, a DESeqResults object with
the \code{log2FoldChange} column replaced with a shrunken LFC.
If \code{res} is missing, just the shrunken LFC vector.
}
\description{
This function adds shrunken log2 fold changes (LFC) to a
results table which was run without LFC moderation.
}
\details{
At the moment, shrinkage cannot be applied to coefficients
in a model with interaction terms, but this will hopefully
be added as a feature in the devel cycle of version 1.17.
}
\examples{

 dds <- makeExampleDESeqDataSet(betaSD=1)
 dds <- DESeq(dds, betaPrior=FALSE)
 res <- results(dds)
 res.shr <- lfcShrink(dds=dds, coef=2, res=res)
 res.shr <- lfcShrink(dds=dds, contrast=c("condition","B","A"), res=res)

}
