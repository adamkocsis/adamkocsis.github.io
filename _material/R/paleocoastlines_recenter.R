# Script to plot Paleocoastlines (or anything similiar) in Mollweide

# download the data from Zenodo with the chronosphere
library(chronosphere)

# pre-requisites:
library(sf)
library(via)

# actual download (creates a single object with all sfcs)
pc <- chronosphere::fetch("paleomap", "paleocoastlines", verbose)

# separate coast and margin (you might only need the coast)
coast <-pc["40", "coast"]
margin <-pc["40", "margin"]

plot(margin, col="#D7EBEB", border=NA)
plot(coast, col="#CDB991", add=TRUE, border=NA)

# break things up at the meridian: in this case: 100 - change consistently!
brokenCoast <- sf::st_break_antimeridian(coast, lon_0=100 )
brokenMargin <- sf::st_break_antimeridian(margin, lon_0=100 )

# target proj4string
crsmoll <- "+proj=moll +lon_0=100 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"

# First try - won't work
transCoast <- sf::st_transform(brokenCoast, crsmoll)

# UGLY PLOT:
plot(transCoast, col="gray")

# The problem is that although st_break_antimeridian() actually breaks up the shape, it will not insert new points around the new map edge, which is just connected with a linear segment. The solution is to insert these points, which we can do if only recenter first and keep the long-lat projection, after which we increase the density of the points using linear interpolation in long-lat space. When we transform the higher-density polygons, the edge of the map should render properly. 

########################################
# We increase density of points with smoothr
library(smoothr)

# 1. first rotate the projection, without changing it
crshalf <- "+proj=longlat +lon_0=100 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"
transCoast <- sf::st_transform(brokenCoast, crshalf)
transMargin <- sf::st_transform(brokenMargin, crshalf)

# denisfiy (will increase plots' size!, default is 10)
denseCoast <- smoothr::densify(transCoast)
denseMargin <- smoothr::densify(transMargin)

# now  it can be projected to Mollweide!
mollCoast <- sf::st_transform(denseCoast, crsmoll)
mollMargin <- sf::st_transform(denseMargin, crsmoll)

plot(mollMargin, col="#6ED2FA")
plot(mollCoast, col="#CDB991", add=TRUE)

# If you need the edge of the map, then you can get it from here
library(rgplates)

# the edge of the map 
me <- rgplates::mapedge()

# transform to regular Mollweide: the trick is that even though the maps are recentered
# their coordinates in mollweide space will be the same
meMoll <- sf::st_transform(me, "ESRI:54009")

# even more detailed plot
plot(meMoll, col="#3C96AA")
plot(mollMargin, col="#D7EBEB", add=TRUE, border=NA)
plot(mollCoast, col="#CDB991", add=TRUE, border=NA)
plot(meMoll, add=TRUE, col=NA, lwd=2) # replot for even border
