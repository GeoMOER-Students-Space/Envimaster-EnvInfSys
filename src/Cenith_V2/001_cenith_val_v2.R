#' Mandatory: Cenith V2 Validation 
#'
#' @description Optional: used to test parameters for the Cenith Segmentation
#' @name Mandatory Cenith  
#' @export Mandatory Cenith

#' @param Mandatory if function: chm - a canopy height model
#' @param Mandatory if function: a, b - parameters for moving window
#' predefinition in var is recommended
#' @param Mandatory if function: h - minimum height to detect trees
#' @param Mandatory if function: optional f - numeric, must be odd, chm fxf filter,
#' uses a spatial mean filter
#' @param Mandatory if function: optional vp - a pointlayer (shp) with positions of Trees

cenith_val_v2 <-function(chm,f=1,a,b,h,vp){
  result <- data.frame(matrix(nrow = 3, ncol = 5))
  if (f>1){
    cat(paste0("### Cenith computes chm with mean filter ",as.factor(f)," ###",sep = "\n"))
    chm <- raster::focal(chm,w=matrix(1/(f*f),nrow=f,ncol=f))
  } else {chm = chm}   ### filter function seperate
  
for (i in seq(1:length(a))){
  cat       ("#############################",sep="\n")
  cat       ("#############################",sep="\n")
  cat(paste0("### Cenith starts with loop a ",as.factor(i)," / ",as.factor(length(a))," ###",sep = "\n"))
  cat       ("#############################",sep="\n")
  cat       ("#############################",sep="\n")
  if(i==1){
    res <-cenith_val4b(chm,a[i],b,h,vp)
  }    else {
    res2 <-cenith_val4b(chm,a[i],b,h,vp)
    res= rbind(res,res2)}
  cat       ("#############################",sep="\n")
  cat       ("#############################",sep="\n")
  cat(paste0("### Cenith rdy with a ",as.factor(i)," / ",as.factor(length(a))," ###",sep = "\n"))
  cat       ("#############################",sep="\n")
  cat       ("#############################",sep="\n")
  
  
}
  names(res)<- c("a","b","hitrate","empty","fail","height")
  return(res)
}

###example

### first load envrmt
require(ForestTools)
require(uavRst)
source(file.path(root_folder, file.path(pathdir,"Cenith_V2/cenith_val4b.R")))

##load data 
chm <- raster::raster(file.path(root_folder, file.path(pathdir,"Cenith_V2/exmpl_chm.tif")))
vp <-  rgdal::readOGR(file.path(root_folder, file.path(pathdir,"vp_wrongproj.shp")))
vp <- spTransform(vp,"+proj=utm +zone=32 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs")
compareCRS(chm,vp)  

###run Cenith Validation
cval <- cenith_val_v2(chm,f=1,c(0.04,0.08),c(0.1),8,vp=vp)
cval
cval[which.max(val$hitrate),]

  