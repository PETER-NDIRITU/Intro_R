setwd("C:/Users/thuku/OneDrive/Documents/GeoSpatial Developments/R Studio/Making Maps in R")
Census.Data<-read.csv("practicaldata.csv")
print(Census.Data)
summary(Census.Data)
library(leaflet)
# turns view map on
tmap_mode("view")
Output.areas <- read_sf("Camden_oa11.shp")
plot(Output.areas)
QA.Census <- merge(Output.areas, Census.Data, by.x="OA11CD", by.y="OA")

proj4string(QA.Census) <- CRS("+init=EPSG:27700")
library(tmap)
library(raster)
install.packages("dismo")
library(dismo)
google.map <- gmap("Camden, London", type = "satellite")
# interactive maps in tmap


install.packages("mapdeck")
library(mapdeck)
set_token(Sys.getenv("MAPBOX"))

ms = mapdeck_style("light") # nolint
mapdeck(style = ms, pitch = 45, location = c(0, 37), zoom = 7)

