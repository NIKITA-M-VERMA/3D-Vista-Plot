# Load necessary libraries
library(sf)
library(rayvista)
library(units)

# Correct file path
shapefile_path <- "C:/Users/nikit/Downloads/MunicipioCaatinga/MunicipioCaatinga25km.shp"

# Read the shapefile
region <- read_sf(shapefile_path)

# Buffer the region and set up the area
area <- st_buffer(region, dist = set_units(200, "km")) %>% 
  st_bbox() %>% 
  st_as_sfc() %>% 
  st_sf(crs = st_crs(region))

# Plot with rayvista
ray <- plot_3d_vista(req_area = area, theta = 10, phi = 30, zscale = 20, 
                     elevation_detail = 6, overlay_detail = 2, img_provider = "OpenTopoMap")
