\name{location.db}
\alias{location.db}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
SQLite data base connection
}
\description{
Return a SQLite data base object for the mobile device being queried against.
}
\usage{
location.db(user.name, device.name)
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
A SQLite data base connection
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Drew Conway
}
\note{
This data base contains much more data than just location information.  The functions in this package are primarily concerned with this data, but you have access to much more.  See the example below for the other table names.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
For more information on working with SQLite data bases see the RSQLite documentation, http://cran.r-project.org/web/packages/RSQLite/RSQLite.pdf
}
\examples{
library(stalkR)
conn<-location.db("agconway","Drew Conway's iPhone")
dbListTables(location.db("agconway","Drew Conway's iPhone"))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{datagen}

