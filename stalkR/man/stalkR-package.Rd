\name{stalkR-package}
\alias{stalkR-package}
\alias{stalkR}
\docType{package}
\title{
Convenience functions for parsing iPhone and iPad location data and visualizing.
}
\description{
As discovered by Alasdair Allan Pete Warden (http://petewarden.github.com/iPhoneTracker/), iPhone and iPad devices have been silently recording the location of the device.  This package contains three convenience functions for parsing the location data and visualizing.
}
\details{
\tabular{ll}{
Package: \tab stalkR\cr
Type: \tab Package\cr
Version: \tab 0.01\cr
Date: \tab 2011-04-21\cr
License: \tab Simplified BSD License\cr
LazyLoad: \tab yes\cr
Depends: \tab XML, RSQLite, ggplot2, maps\cr
}
}
\author{
Drew Conway

Maintainer: Drew Conway <drew.conway@nyu.edu>
}
\references{
For more information on this data and how it was discovered, see http://petewarden.github.com/iPhoneTracker/
}
\examples{
library(stalkR)
my.locs<-get.mylocations("mike","Mike Dewar's iPhone")
viz.locations(my.locs, "state", "new york")
}
\keyword{package}
