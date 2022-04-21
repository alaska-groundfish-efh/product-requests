#Code from Jeremy:

a.rough.efh<-raster("Y:/RACE_EFH_variables/Trawl_Models2/GOA/adult_rougheyerockfish/ensemble_efh")

a.rough.poly0 <- stars::st_as_stars(a.rough.efh)
a.rough.poly <- sf::st_as_sf(a.rough.poly0,merge = TRUE)

# The a.rough.poly has multiple polygons, but you can select just the ones you want
a.rough.poly2 <- a.rough.poly[a.rough.poly$layer >3, ]         # this would give you the 50% and 25% (core + hotspot)
a.rough.poly3 <- a.rough.poly[a.rough.poly$layer >1, ]         # this would give you the full EFH

# if you want to flatten in, you can change the "layer" values using standard R notation
a.rough.poly4<-a.rough.poly2
a.rough.poly4[a.rough.poly4$layer==5]<-4                      # This flattens out the hotspot to just have one polygon for the whole core EFH

# you can check by just calling plot
plot(a.rough.poly4)

sf::st_write(obj = a.rough.poly2,dsn = "Y:/RACE_EFH_variables/Trawl_Models2/Jane_rockfish_shapefiles/adult_rougheyerockfish/adult_rougheyerockfish_core.shp",
         driver = "ESRI Shapefile")

# read it back into R to test if came out right
test.poly<-sf::st_read("Y:/RACE_EFH_variables/Trawl_Models2/Jane_rockfish_shapefiles/adult_rougheyerockfish/adult_rougheyerockfish_core.shp")
plot(test.poly)
