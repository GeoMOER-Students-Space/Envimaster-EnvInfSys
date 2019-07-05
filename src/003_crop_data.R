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

#load shp and list rasters in folder
shp <-rgdal::readOGR(file.path(envrmt$path_vector,"trees.shp"))
crs(shp)
shp2 <-spTransform(shp, CRS("+proj=utm +zone=32 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs "))
crs(shp2)
ls <- list.files(file.path(envrmt$path_raster),pattern='\\.tif$')
ls

rst <- raster::brick(file.path(envrmt$path_raster, ls[1]))
plot(rst)
rst
#create bbox
bb <- bbox(shp2)
bb

bb2 <- bb[-3,]
bb2
# get extent
ext <- extent(bb2)
ext


ext2 <-c(ext[1]-20,ext[2]+20,ext[3]-20,ext[4]+20)
ext2

c <- crop(rst,ext)
c2 <- crop(rst,ext2)

plot(c)
plot(c2)

raster::writeRaster(c,filename=paste0(file.path(envrmt$path_tmp,"c.tif"),"croped.tif"),overwrite = TRUE,NAflag = 0)
raster::writeRaster(c2,filename=paste0(file.path(envrmt$path_tmp,"c2.tif"),"croped2.tif"),overwrite = TRUE)

crs(rst)
crs(c)
crs(shp2)

shp2 <-spTransform(shp, CRS("+proj=utm +zone=32 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs "))
crs(shp2)
dem <- raster::raster(file.path(envrmt$path_raster, "exampl_dem.tif"))

ls <- list.files(file.path(envrmt$path_raster),pattern='\\.tif$')
ls
stk <- raster::stack(ls)
stk
stk <- raster::stack(file.path(envrmt$path_raster,ls))
rst <- raster::raster(file.path(envrmt$path_raster, ls[1]))
ls[1]
names(rst)
# read treepos layer
sl <- list.files(envrmt$path_vector)
sl
shp <- rgdal::readOGR(file.path(envrmt$path_vector,"trees.shp"))
plot(shp)
#get bbox from shp
library(sf)
bb <- st_bbox(shp)
plot(bb)

#versuch ausschrieben und wiedereinladen als shp
library(rgdal)
writeOGR(bb,file.path(envrmt$path_tmp, "bbox.shp"),"layername", driver="ESRI Shapefile")


bbx <- bboxSpatialPolygon(bb, proj4stringFrom = "+proj=utm +zone=32 +ellps=GRS80 +units=m +no_defs" ,
                          proj4stringTo = "+proj=utm +zone=32 +ellps=GRS80 +units=m +no_defs" )
bb
extend <- buffer(shp,20)
plot(shp)
plot(extend)
#crop raster by shp
crop <- raster::crop(rst,extend)
i=3
raster::writeRaster(crop,filename=paste0(file.path(envrmt$path_tmp,paste("/crop2",as.factor(i),".tif")),overwrite = TRUE,NAflag = 0))
raster::writeRaster(crop,filename=paste0(file.path(envrmt$path_tmp),"/crop.tif"),overwrite = TRUE,NAflag = 0)


plot(crop)
buf <- buffer(crop,20)
plot(buf)
bbox <-bbox(shp)
test <-bb[1]
test
test <-extent(crop)
test[1]


files <- list.files(pattern="n_msi.*.img$")  
files
crop
### paste0 weg und nur file.path
crop
cr <- extend(crop,c(200,200))
cr
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