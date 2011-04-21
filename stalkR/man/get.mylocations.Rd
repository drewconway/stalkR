\name{get.mylocations}
\alias{get.mylocations}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get location data for a device
}
\description{
Creates a data frame from the \'CellLocation\' table in device location data base
}
\usage{
get.mylocations(user.name, device.name)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{user.name}{
(character) The user name on the Mac OS X install, such that the path is /Users/user.name/...
}
  \item{device.name}{
(character) The name of the iPhone or iPad you want location data for as it appears in iTunes
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
A data frame from the \'CellLocation\' table.  We are primarily interested in the Longitude and Latitude columns, but there is considerable more data stored in this data frame.
}
\references{
For more information see, http://petewarden.github.com/iPhoneTracker/
}
\author{
Drew Conway
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
library(stalkR)
my.locs<-get.mylocations("agconway","Drew Conway's iPhone")
summary(my.locs)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{datagen}
