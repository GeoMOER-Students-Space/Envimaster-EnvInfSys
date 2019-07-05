#' Mandatory: Masked Reaper
#'
#' @description Optional: Crops multiple Objects with a mask and buffer
#' @name Mandatory Reaper 
#' @export Mandatory Reaper

#' @param Mandatory if function: shp - a shp from where the bounding box should be taken
#' @param Mandatory if function: ls - a list obj containing the filenames of the rasterobjects to be cropped
#' predefinition in var is recommended
#' @param Mandatory if function: buf - a buffer in meter to increase the extent of the mask
#' @param Mandatory if function: output - a folder to save several rasterlayers 
#' predefinition in var is recommended
#' @param Mandatory if function: prename - characters in "" adds a name to the original Rastername
#' predefinition in var is recommended
#' @param Mandatory if function: proj - desired projection for output data, predefinition in var is recommended
#' predefinition in var is recommended

masked_reaper <- function(shp,ls,buf=20,output,proj,prename){
  shp <-spTransform(shp, CRS(proj))
  bb <- bbox(shp)
  bb2 <- bb[-3,]
  ext <- extent(bb2)
  ext2 <-c(ext[1]-buf,ext[2]+buf,ext[3]-buf,ext[4]+buf)
  ext2
  cat("### Reaper prepares mask ###",sep = "\n")
  for (i in (1:length(ls))){
    rst <- raster::brick(file.path(envrmt$path_raster, ls[i]))
    cat(" ",sep = "\n")
    cat(paste0("### Reaper starts cropping raster ",as.factor(i)," / ",as.factor(length(ls))," ###",sep = "\n"))
    cropped <- crop(rst,ext2)
    name <- paste(prename, names(rst), sep="")
    raster::writeRaster(cropped,filename=paste0(file.path(output,name[i]),".tif"),overwrite = TRUE)
    cat(" ",sep = "\n")
    cat(paste0("### Reaper wrote raster ",as.factor(i)," / ",as.factor(length(ls))," ###",sep = "\n"))
    
  }
  cat(" ",sep = "\n")
  cat("### Reaper finished ###",sep = "\n")
}

#example
#proj="+proj=utm +zone=32 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs "
#output=envrmt$path_tmp
#prename= "cropped_"
#ls=ls
#test <- masked_reaper(shp=shp,buf=20,proj=proj,output=output,prename=prename,ls=ls)

