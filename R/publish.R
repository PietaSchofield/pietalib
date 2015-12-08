#' Publish all relevant files from the local directory to my public_html tree
#'
#' @param filename
#' @param rstudio
#'
#' @export
publish <- function(filePath,note=T,outStub=NULL,delete=F){
  fileName <- gsub("[.]Rmd","",basename(filePath))
  devDir <- dirname(filePath)
  projName <- basename(devDir)
  devDir <- paste0(devDir,"/")
  if(note) outStub <- "notebook"
  outDir <- paste0("/Volumes/pschofield/Projects/",projName,"/web/",outStub,"/")

  system(paste0("sed -i.bak 's/libs\\//\\/user\\/pschofield\\/libs\\//g' ",
                devDir,fileName,".html"))
  # copy the file
  file.copy(paste0(devDir,fileName,".html"),paste0(outDir,fileName,".html"),
            overwrite=T)
  dir.create(paste0(outDir,fileName,"_files/figure-html"),rec=T,showWarnings = F)
  # copy all the pictures
  success <- lapply(list.files(paste0(devDir,fileName,"_files"),
                               pattern="*[.]*",recur=T),
                    function(fn){
                      file.copy(from = paste0(devDir,fileName,"_files/",fn),
                                to = paste0(outDir,fileName,"_files/",fn),overwrite=T)
                    })
  system(paste0("open http://www.compbio.dundee.ac.uk/user/pschofield/",
                "Projects/",projName,"/",outStub,"/",fileName,".html"))
  if(delete){
    unlink(paste0(devDir,fileName,"_files"),rec=T,force=T)
    unlink(paste0(devDir,fileName,".html*"))
  }
}