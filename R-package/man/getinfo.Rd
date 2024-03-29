% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xgb.Booster.R, R/xgb.DMatrix.R
\name{getinfo.xgb.Booster}
\alias{getinfo.xgb.Booster}
\alias{setinfo.xgb.Booster}
\alias{getinfo}
\alias{getinfo.xgb.DMatrix}
\alias{setinfo}
\alias{setinfo.xgb.DMatrix}
\title{Get or set information of xgb.DMatrix and xgb.Booster objects}
\usage{
\method{getinfo}{xgb.Booster}(object, name)

\method{setinfo}{xgb.Booster}(object, name, info)

getinfo(object, name)

\method{getinfo}{xgb.DMatrix}(object, name)

setinfo(object, name, info)

\method{setinfo}{xgb.DMatrix}(object, name, info)
}
\arguments{
\item{object}{Object of class \code{xgb.DMatrix} of \code{xgb.Booster}.}

\item{name}{the name of the information field to get (see details)}

\item{info}{the specific field of information to set}
}
\value{
For \code{getinfo}, will return the requested field. For \code{setinfo}, will always return value \code{TRUE}
if it succeeds.
}
\description{
Get or set information of xgb.DMatrix and xgb.Booster objects
}
\details{
The \code{name} field can be one of the following for \code{xgb.DMatrix}:

\itemize{
\item \code{label}
\item \code{weight}
\item \code{base_margin}
\item \code{label_lower_bound}
\item \code{label_upper_bound}
\item \code{group}
\item \code{feature_type}
\item \code{feature_name}
\item \code{nrow}
}
See the documentation for \link{xgb.DMatrix} for more information about these fields.

For \code{xgb.Booster}, can be one of the following:
\itemize{
\item \code{feature_type}
\item \code{feature_name}
}

Note that, while 'qid' cannot be retrieved, it's possible to get the equivalent 'group'
for a DMatrix that had 'qid' assigned.

\bold{Important}: when calling \code{setinfo}, the objects are modified in-place. See
\link{xgb.copy.Booster} for an idea of this in-place assignment works.

See the documentation for \link{xgb.DMatrix} for possible fields that can be set
(which correspond to arguments in that function).

Note that the following fields are allowed in the construction of an \code{xgb.DMatrix}
but \bold{aren't} allowed here:\itemize{
\item data
\item missing
\item silent
\item nthread
}
}
\examples{
data(agaricus.train, package='xgboost')
dtrain <- with(agaricus.train, xgb.DMatrix(data, label = label, nthread = 2))

labels <- getinfo(dtrain, 'label')
setinfo(dtrain, 'label', 1-labels)

labels2 <- getinfo(dtrain, 'label')
stopifnot(all(labels2 == 1-labels))
data(agaricus.train, package='xgboost')
dtrain <- with(agaricus.train, xgb.DMatrix(data, label = label, nthread = 2))

labels <- getinfo(dtrain, 'label')
setinfo(dtrain, 'label', 1-labels)
labels2 <- getinfo(dtrain, 'label')
stopifnot(all.equal(labels2, 1-labels))
}
