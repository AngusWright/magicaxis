\name{magMWdust}
\alias{magMWdust}
\title{
Plot a Milky Way dust overlay
}
\description{
Adds a projected Milky Way dust layer to an existing sky plot using a lookup-table 
constructed from the SFD dust map on an equatorial grid, and drawing the result as 
points or filled polygons.
}
\usage{
magMWdust(type = "p", pch = 16, pt.cex = 0.5,
  opacity.range = c(0, 0.5),
  whiteblack.percentile = c(0.5, 0.95),
  stretch = "lin",
  min.opacity.plot = 0.01, ...)
}
\arguments{
  \item{type}{
Character scalar giving the drawing mode: \code{"p"} for points or \code{"pl"}
for polygons.
}
  \item{pch}{
Plotting symbol used when \code{type = "p"}.
}
  \item{pt.cex}{
Point expansion factor used when \code{type = "p"}.
}
  \item{opacity.range}{
Two-element numeric vector giving the output opacity range passed to
\code{\link{magmap}}.
}
  \item{whiteblack.percentile}{
Two-element numeric vector giving the lower and upper percentiles used when
mapping dust values to opacity.
}
  \item{stretch}{
Stretch mode passed through to \code{\link{magmap}}.
}
  \item{min.opacity.plot}{
Minimum mapped opacity required for a grid cell to be drawn.
}
  \item{\dots}{
Additional arguments passed to \code{\link{magproj}}.
}
}
\details{
The function looks up \code{E(B-V)} values from the SFD dust map, sampled on a 1x1 deg grid and including 
only cells with values greater than approximately 6 (equating to the 40th percentile of \code{E(B-V)} amplitudes and
above). These values are then mapped to point (or polygon, see below) opacity with \code{\link{magmap}}.

When \code{type = "pl"} each retained grid cell is drawn as a projected
four-corner polygon. Otherwise the retained cells are drawn as projected
points. Polygon drawing is very slow when drawing to X11 (many minutes) except 
with very low resolutions. Polygon drawing may nonetheless be preferable when 
writing to file, where the operation is much faster and reduces aliasing effects 
caused by over- (or under-)lapping points. 
}
\value{
Returns \code{NULL} invisibly. The function is called for its plotting side
effects.
}
\author{
Angus H Wright 
}
\seealso{
\code{\link{dust_getval}}, \code{\link{magmap}}, \code{\link{magproj}}
}
\examples{
  magproj(0,0,type='n') #Construct a base magproj plot 
  magMWdust() #add MW dust map as points 
  \dontrun{
  magMWdust(type = "pl") #add MW dust map as polygons 
  }
}
\keyword{dust}
\keyword{plot}
