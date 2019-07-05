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

#load function
source(file.path(envrmt$path_000_dev,"reaper_masked.R"))

#predefine arguments
shp <-rgdal::readOGR(file.path(envrmt$path_vector,"trees.shp"))
utm="+proj=utm +zone=32 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs "
output=envrmt$path_tmp
prename= "aoi_"
ls=list.files(file.path(envrmt$path_raster),pattern='\\.tif$')
ls
#run Reaper
masked_reaper(shp=shp,buf=20,proj=utm,output=output,prename=prename,ls=ls)

# end of script