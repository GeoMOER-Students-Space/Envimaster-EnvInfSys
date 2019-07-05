#############################################################################################
###--- Setup Environment -------------------------------------------------------------------#
                                  ###############################################           #
# require libs for setup          #EEEE n   n v       v rrrr    m     m   ttttt #           #                  
require(raster)                   #E    nn  n  v     v  r   r  m m   m m    t   #           #         
require(envimaR)                  #EE   n n n   v   v   rrrr   m m   m m    t   #           #                
require(link2GI)                  #E    n  nn    v v    r  r  m   m m   m   t   #           #             
                                  #EEEE n   n     v     r   r m    m    m   t   #           #
                                  ###############################################           #
                                                                                            #
# define needed libs and src folder                                                         #
libs = c("link2GI") 
pathdir = "repo/src/"

#set root folder for uniPC or laptop                                                        #
root_folder = alternativeEnvi(root_folder = "~/edu/Envimaster-EnvInfSys",                   #
                              alt_env_id = "COMPUTERNAME",                                  #
                              alt_env_value = "PCRZP",                                      #
                              alt_env_root_folder = "F:/edu/Envimaster-EnvInfSys")          #
#source environment script                                                                  #
source(file.path(root_folder, paste0(pathdir,"001_setup_envinfsys_v1.R")))                                                              
###---------------------------------------------------------------------------------------###
#############################################################################################

dem <- raster::raster(file.path(envrmt$path_raster, "exampl_dem.tif"))

ls <- list.files(file.path(envrmt$path_raster),pattern='\\.tif$')
ls
stk <- raster::stack(ls)
stk
stk <- raster::stack(file.path(envrmt$path_raster,ls))
rst <- raster::raster(paste(file.path(envrmt$path_raster),"/", ls[1]))
ls[1]

# read treepos layer
sl <- list.files(envrmt$path_vector)
sl
shp <- rgdal::readOGR(file.path(envrmt$path_vector,"trees.shp"))

#get bbox from shp
library(sf)
bb <- st_bbox(shp)
plot(bb)

#crop raster by shp
crop <- raster::crop(rst,shp)
raster::writeRaster(cc,filename=paste0(file.path(envrmt$path_tmp),"/crop.tif"),overwrite = TRUE,NAflag = 0)

#crop raster by bbox
crop_bb <- crop(rst,bbox)
ext <- extent(bb)
bb

#set manuel extend
exbb <-c(bb[1],bb[2],bb[3],bb[3])
exbb
crs(exbb) <-crs(rst)
proj4string(exbb) <- crs(rst)
crs(rst)

crop_exbb <- crop(rst,exbb)
ex <- c(477790,5632192,477883,5632290)
tt
cc <- raster::crop(rst,shp)
plot(cc)
plot(rst)
raster::writeRaster(cc,filename=paste0(file.path(envrmt$path_tmp),"/crop.tif"),overwrite = TRUE,NAflag = 0)

tt
cc
#works read single raster from list/ stack doesnt work due to different extend
rst <- raster::raster(file.path(envrmt$path_raster,ls[1]))

for (i in seq(1:length(ls))){
  rst <- raster::raster(file.path(envrmt$path_raster,ls[i]))
  
}